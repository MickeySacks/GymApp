class TicketsController < ApplicationController
    def index
        @tickets = Ticket.order(:created_at)
    end
    
    def new 
        @ticket = Ticket.new 
    end
  
    def create
        @ticket = Ticket.new(ticket_params)
        if @ticket.save
            flash[:notice] = "New ticket for #{@ticket.name} created"
            redirect_to tickets_path and return
        else
            flash[:alert] = "Failed to save new ticket"
            redirect_to new_ticket_path and return
        end
    end
    
    private
  
    def ticket_params
        params.require(:ticket).permit(:name, :email)
    end
end