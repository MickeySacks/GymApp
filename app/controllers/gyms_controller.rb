class GymsController < ApplicationController
    
    def index
    end
    
    def show
        @gym = Gym.find_by(name: "Trudy")
    end
    
    def update
        @gym = Gym.find_by(name: "Trudy")
        if params[:id] == "1"
            if(@gym.top_floor_occupancy == 0)
                flash[:alert] = "Top Floor is Already Empty"
            else
                @gym.subtract_top_floor()
            end
        elsif params[:id] == "2"
            if(@gym.bottom_floor_occupancy == 0)
                flash[:alert] = "Bottom Floor is Already Empty"
            else
                @gym.subtract_bottom_floor()
            end
        elsif params[:id] == "3"
            if(@gym.top_floor_occupancy == 25)
                flash[:alert] = "Top Floor is at Capacity"
            else
                @gym.add_top_floor()
            end
        else 
            if(@gym.bottom_floor_occupancy == 20)
                flash[:alert] = "Bottom Floor is at Capacity"
            else
                @gym.add_bottom_floor()
            end
        end
        redirect_to tickets_path and return
    end
    

end