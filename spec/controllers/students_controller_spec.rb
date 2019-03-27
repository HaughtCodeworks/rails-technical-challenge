require 'rails_helper'

RSpec.describe StudentsController, type: :request do
  before { @student = create(:student) }
  let(:valid_attributes) { { student: attributes_for(:student) } }

  describe 'GET #index' do
    it 'returns a success response' do
      get students_url
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get new_student_url
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get edit_student_url(@student)
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates a new Student' do
      expect {
        post students_url, params: valid_attributes
      }.to change(Student, :count).by(1)
    end

    it 'redirects to the created student' do
      post students_url, params: valid_attributes
      expect(response).to redirect_to(student_url(Student.last))
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get student_url(@student)
      expect(response).to be_successful
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { student: { first_name: 'Bob', last_name: 'Ross' } }
      end

      it 'updates the requested student' do
        put student_url(@student), params: new_attributes
        @student.reload
        expect(@student.attributes.slice('first_name', 'last_name')).to eq({
          'first_name' => 'Bob',
          'last_name' => 'Ross'
        })
      end

      it 'redirects to the student' do
        put student_url(@student), params: new_attributes
        expect(response).to redirect_to(@student)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested student' do
      expect {
        delete student_url(@student)
      }.to change(Student, :count).by(-1)
    end

    it 'redirects to the students list' do
      delete student_url(@student)
      expect(response).to redirect_to(students_url)
    end
  end
end
