require 'spec_helper'
require 'stringio'

describe "Shiritori test" do
  def capture_stdout
    captured = StringIO.new
    original = $stdout
    $stdout = captured

    yield

    $stdout = original
    captured.string
  end
end
