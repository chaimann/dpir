# Subject == observable
# Observer -> who registers and listens to changes
module Subject
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers(changed)
    @observers.each do |observer|
      observer.update(self, changed)
    end
  end
end


class Repository
  attr_accessor :name
  attr_reader :data
  include Subject

  def initialize(name)
    super()
    @name = name
    @data = ['Data', 'of', 'this', 'repo']
  end

  def push(data)
    @data << data
    notify_observers(:data)
  end
end

class RepoWatcher
  def update(changed_repo, what)
    puts "Changes in #{changed_repo.name} in #{what}: #{changed_repo.send(what)}"
  end
end
