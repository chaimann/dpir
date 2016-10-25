class Task
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_time_required
    0.0
  end
end

class CompositeTask < Task
  def initialize(name)
    super
    @subtasks = []
  end

  def <<(task)
    @subtasks << task
  end

  def delete_task(task)
    @subtasks.delete(task)
  end

  def get_time_required
    @subtasks.reduce(0) { |acc, task| acc + task.get_time_required }
  end
end

class ObtainVisaTask < CompositeTask
  def initialize
    super 'Obtain Visa'
    self << ScheduleVisitTask.new
    self << PrepareDocsTask.new
    self << VisitVCTask.new
    self << ReceiveVisaTask.new
  end
end

class VisitVCTask < Task
  def initialize
    super 'Visit Visa Center'
  end

  def get_time_required
    2.0
  end
end

class ReceiveVisaTask < Task
  def initialize
    super 'Wait for visa to be delivered'
  end

  def get_time_required
    168.0
  end
end

class PrepareDocsTask < CompositeTask
  def initialize
    super 'Prepare docs'
    self << GetBankInquiryTask.new
    self << MakeVisaPhotosTask.new
    self << BookHotelTask.new
  end
end

class ScheduleVisitTask < Task
  def initialize
    super 'Schedule visit to Visa Center'
  end

  def get_time_required
    1.0
  end
end

class GetBankInquiryTask < Task
  def initialize
    super 'Get inquiries from bank'
  end

  def get_time_required
    1.0
  end
end

class MakeVisaPhotosTask < Task
  def initialize
    super 'Make photos 3.5x4.5'
  end

  def get_time_required
    1.5
  end
end

class BookHotelTask < Task
  def initialize
    super 'Book hotel'
  end

  def get_time_required
    1.0
  end
end
