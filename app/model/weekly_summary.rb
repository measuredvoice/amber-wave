class WeeklySummary < Model
  include S3Storage
  attr_accessor :account_summaries, :end_date, :tweet_summaries
  
  def self.from_metrics(end_date)
    summary = self.new(
      :end_date => end_date,
      :tweet_summaries => [],
      :account_summaries => [],
    )
    
    (0..6).each do |n|
      target_date = end_date - n.days
      
      puts "Getting daily summary from #{target_date.strftime('%Y-%m-%d')}..."
      if ds = DailySummary.from_summary_file(target_date)
        summary.tweet_summaries += ds.tweet_summaries
      end
    end
    
    summary
  end
  
  def self.from_json(text)
    puts "Loading weekly summary file from JSON..."
    data = MultiJson.load(text, :symbolize_keys => true)
    self.new(
      :end_date => Time.zone.parse(data[:end_date]),
      :tweet_summaries => data[:tweets].map { |ts| TweetSummary.new(ts) },
      :account_summaries => data[:accounts].map { |as| AccountSummary.new(as) },      
    )
  end
  
  def self.from_summary_file(target_date)
    s3_obj = s3_bucket.objects[filename(target_date)]
    if s3_obj.exists?
      self.from_json(s3_obj.read)
    else
      nil
    end
  end
  
  def to_json
    JSON.pretty_generate(Boxer.ship(:weekly_summary, self))
  end

  def iso_date
    end_date.strftime('%Y-%m-%d')
  end
  
  def filename
    self.class.filename(end_date)
  end
  
  def self.filename(end_date)
    "#{date_path(end_date)}/weekly_summary.json"
  end
  
  def self.date_path(date)
    "summaries/#{date.strftime('%Y/%m/%d')}"
  end
end
