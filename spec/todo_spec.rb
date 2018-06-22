require_relative '../src/task'

describe 'To Do List' do

  it 'cans not have null task name argument' do
    task = ''
    date = [2018,7,29]
    expect{
      Task.new(task, date)
    }.to raise_error(Task::NullArgumentTask)
  end

  it 'knows how many days do you have to do the task' do
    task = 'Recoger el tendido'
    date = [2018,7,29]
    expect(Task.new(task, date).remaining_time).to eq('8 days, 7 hours with 26 seconds')
  end

  it 'has to recieve a future date' do
    task = 'Recoger el tendido'
    date = [1996,10,25]
    expect{
      Task.new(task, date).remaining_time
    }.to raise_error(Task::DateError)
  end

  it 'returns the action' do
    task = 'Recoger el tendido'
    date = [2018,7,29]
    expect(Task.new(task,date).return_action).to eq (task)
  end

  it 'does not care if have not date appointment' do
    task = 'Recoger el tendido'
    date = []
    expect(Task.new(task,date).return_action).to eq (task)
  end

end
