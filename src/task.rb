class Task

  class DateError < StandardError; end
  class NullArgumentTask < StandardError; end

  def initialize(action, date)
    raise NullArgumentTask if action.to_s.empty?

    @action = action

    if !date.empty? then
      @date = Time.new(date[0], date[1], date[2])
      raise DateError if !valid_date?
    end
  end

  def return_action
    @action
  end

  def valid_date?
    @date > Time.now || @date == nil
  end

  def remaining_time
    #time = @date - Time.now              #Use this
    time_reference = Time.new(2018,7,20,16,34)  #Delete
    time = @date - time_reference         #Delete

    total_remaining_minutes = time / 60
    total_remaining_hours = total_remaining_minutes / 60
    remaining_minutes = (total_remaining_minutes % 60)
    total_remaining_days = (total_remaining_hours / 24)
    remaining_hours = (total_remaining_hours % 24)

    [total_remaining_days, remaining_hours, remaining_minutes]
    "#{take_off_decimals(total_remaining_days)} days, #{take_off_decimals(remaining_hours)} hours with #{take_off_decimals(remaining_minutes)} seconds"
  end

  def take_off_decimals(number)
    '%.0f' % number
  end
end
