require 'securerandom'

class Artistripe
  class ConnectionError < StandardError; end

  def create_charge(reference, total)
    raise ConnectionError if connection_error?

    return {
      total: total,
      reference: reference,
      id: SecureRandom.hex(20)
    }
  end

  private

  def connection_error?
    rand < 0.2
  end
end