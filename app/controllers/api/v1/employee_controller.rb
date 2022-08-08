module Api
    module V1

        class EmployeeController < ApplicationController
            def index
                @employee = Employee.all
                render json: @employee
            end

            def show
                @employee = Employee.find(params[:id])
                render json: @employee
            end

            def destroy
                @employee = Employee.find(params[:id])
                
                if @employee.present?
                    @employee.destroy
                    render json: @employee
                else
                    render json: {error: "Employee not found"}
                end
            end

            def update
                @employee = Employee.find(params[:id])
                if @employee.update(employee_params)
                    render json: @employee
                else
                    render json: @employee.errors, status: :unprocessable_entity
                end
            end

            def create
                @employee = Employee.new(employee_params)
                
                if @employee.save
                    render json: @employee, status: :created
                else
                    render json: @employee.errors, status: :unprocessable_entity
                end
            end

            private 

            def employee_params
                params.require(:employee).permit(:name, :address)
            end
        end
    end
end

