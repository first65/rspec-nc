require 'rspec/core/formatters/base_formatter'
require 'notifier'
require 'terminal-notifier'

class Nc < RSpec::Core::Formatters::BaseFormatter
  SUCCESS_EMOJI = "\u2705".freeze
  FAILURE_EMOJI = "\u26D4".freeze

  RSpec::Core::Formatters.register self, :dump_summary

  def dump_summary(notification)
    body = "Finished in #{notification.formatted_duration}\n#{notification.totals_line}"
    if notification.failure_count > 0
      title = "#{FAILURE_EMOJI} #{directory_name}: #{notification.failure_count} failed example#{notification.failure_count == 1 ? nil : 's'}"
      sound = 'Frog'
    else
      title = "#{SUCCESS_EMOJI} #{directory_name}: Success"
      sound = 'Pop'
    end
    notify title, body, sound
  end

  private

  def directory_name
    File.basename File.expand_path '.'
  end

  def notify(title, body, sound)
    Notifier.default_notifier = :terminal_notifier if `uname`[/darwin/i]
    Notifier.notify(
      message: body,
      title: title,
      sound: sound,
      group: Process.pid,
      image: project_root / 'app' / 'assets' / 'images' / 'themes' / 'bruce' / 'favicon-96.png'
    )
  end

  def project_root
    return Pathname.new(ENV['PROJECT_HOST_ROOT']) if ENV['PROJECT_HOST_ROOT']
    Rails.root
  end
end
