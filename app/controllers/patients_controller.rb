class PatientsController < ApplicationController
  def index
    patients = Patient.all
    render json: patients
  end

  def show
    patient = Patient.find(params[:id])
    render json: patient, include: :appointments
  end

  def create
    patient = Patient.new(patient_params)
    if patient.save
      render json: patient, status: :created
    else
      render json: { errors: patient.errors.messages }, status: :unprocessable_entity
    end
  end

  def update
    patient = Patient.find(params[:id])
    if patient.update(patient_params)
      render json: patient
    else
      render json: { errors: patient.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    patient = Patient.find(params[:id])
    patient.destroy
    render json: { message: "Patient deleted" }
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :age, :gender, :phone, :email)
  end
end
