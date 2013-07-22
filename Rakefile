require './shining-sea'

namespace :app do
  desc "Gather recent metrics from the Twitter API"
  task :collect_metrics do
    start_time = Time.zone.now
    files_written = 0
    Account.all.each do |account|
      puts "Account: #{account.screen_name}"      
      metrics_file = MetricsFile.new(:account => account, :date => 2.days.ago)

      if metrics_file.already_exists?
        puts "...file already exists. Skipping."
        next
      end

      account.get_twitter_details! || next
      
      metrics_file.tweets = account.tweets_on(metrics_file.date).map do |tweet|
        puts "  extracting metrics for tweet #{tweet.id}..."
        metric = TweetMetric.from_tweet(tweet)
        metric.count_reach!
        metric
      end
            
      puts "  writing file #{metrics_file.filename}..."
      # puts metrics_file.to_json
      if metrics_file.save
        puts "...done."
        files_written += 1
      else
        puts "ERROR: That didn't work for some reason."
      end
    end
    end_time = Time.zone.now
    
    elapsed = (end_time - start_time).to_i
    puts "Wrote #{files_written} files in #{elapsed} seconds."
  end
  
  desc "Generate daily metrics summary data"
  task :daily_metrics do
  end
  
  desc "Generate weekly metrics summary data"
  task :weekly_metrics do
  end
  
  desc "Build and deploy daily HTML reports"
  task :daily_reports do
  end
  
  desc "Build and deploy weekly HTML reports"
  task :weekly_reports do
  end
end
