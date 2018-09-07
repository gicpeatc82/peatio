module Private
  class TicketsController < BaseController


    def index
      @tickets = current_user.tickets
    end

    def new
      @ticket = Ticket.new
    end

    def create
      @ticket = current_user.tickets.create(ticket_params)
      @ticket.save

      if @ticket.save
        flash[:notice] = I18n.t('private.tickets.ticket_create_succ')
        redirect_to tickets_path
        ContactMailer.send_mail(@ticket.id).deliver_now
      else
        flash[:alert] = I18n.t('private.tickets.ticket_create_fail')
        render :new
      end
    end

    private

    def ticket_params
      params.require(:ticket).permit(:title, :content, :aasm_state, :author_id)
    end
  end
end
