class AppointmentsController < ApplicationController
  def index
    appointments = Appointment.all.includes(:doctor, :patient)
    render json: appointments, include: [:doctor, :patient]
  end

  def show
    appointment = Appointment.find(params[:id])
    render json: appointment, include: [:doctor, :patient]
  end

  def create
    appointment = Appointment.new(appointment_params)
    if appointment.save
      render json: appointment, include: [:doctor, :patient], status: :created
    else
      render json: { errors: appointment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    appointment = Appointment.find(params[:id])
    if appointment.update(appointment_params)
      render json: appointment, include: [:doctor, :patient]
    else
      render json: { errors: appointment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    appointment = Appointment.find(params[:id])
    appointment.destroy
    render json: { message: "Appointment cancelled" }
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :date, :reason)
  end
end
