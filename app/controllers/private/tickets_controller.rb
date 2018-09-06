module Private
  class TicketsController < BaseController


    def index

    end

    def new
      @ticket = Ticket.new
    end
  end
end
