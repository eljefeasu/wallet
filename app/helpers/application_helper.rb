module ApplicationHelper
  def geoff(datetime)
    distance_of_time_in_words_to_now(datetime) + " ago, suckas"
  end
end
