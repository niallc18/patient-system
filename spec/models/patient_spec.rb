# spec/models/patient_spec.rb

require 'rails_helper'

RSpec.describe Patient, type: :model do

  describe Patient do
    before(:each) do
      User.delete_all
      Patient.delete_all
    end
  end

  describe "#create" do
    it "create a patient" do
      new_patient = Patient.new(first_name: "jack", last_name: "smith", dob: "10-10-2000", gender: "male")
      expect(new_patient).to be_valid
    end
  end

  describe "#invalid" do
    it "create an invalid patient" do
      new_patient = Patient.new(first_name: "", last_name: "smith", dob: "10-10-2000", gender: "male")
      expect(new_patient).to be_invalid
    end
  end

end

