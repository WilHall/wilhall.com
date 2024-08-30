module Try
  def self.times(tries, wait_between: nil, on_tries_exhausted: nil, &block)
    begin
      tries -= 1
      yield
    rescue => e
      sleep(wait_between) if wait_between.present?
      retry if tries > 0

      if tries == 0
        raise e unless on_tries_exhausted.present?
        on_tries_exhausted.call(e) if on_tries_exhausted.present?
      end
    end
  end
end