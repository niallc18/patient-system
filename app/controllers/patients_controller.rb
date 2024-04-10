class PatientsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_patient, only: [:show, :edit, :update, :destroy]
  
    def index
      @patients = policy_scope(Patient)
      authorize @patients
    end
  
    def show
      authorize @patient
    end
  
    def new
      @patient = Patient.new
      authorize @patient
    end
  
    def edit
      authorize @patient
    end
  
    def create
      @patient = Patient.new(patient_params)
      authorize @patient
  
      if @patient.save
        redirect_to @patient, notice: 'Patient was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def update
      authorize @patient
      if @patient.update(patient_params)
        redirect_to @patient, notice: 'Patient was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      authorize @patient
      @patient.destroy
      redirect_to patients_url, notice: 'Patient was successfully destroyed.'
    end
  
    def patient_stats
      authorize :patient, :patient_stats?
      patient_creations_by_day = Patient.group("DATE(created_at)").count
      @patient_creations_data = patient_creations_by_day.map { |date, count| [date.to_s, count] }
    end

    private
  
    def set_patient
      @patient = Patient.find(params[:id])
    end
  
    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :dob, :gender)
    end
  end
  