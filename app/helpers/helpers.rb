def time_created(object)
  @time = (Time.now - object.created_at).to_i
  # minutes
  if @time / 60 <  60
    "#{@time / 60} minutes"
  # hours
  elsif @time / 3600 < 24
    "#{@time / 3600} hours"
  # days
  elsif @time / (3600 * 24) < 365
    "#{@time / (3600 * 24)} days"
  # years
  else
    "#{@time / (3600 * 24 * 365)} years"
  end
end
