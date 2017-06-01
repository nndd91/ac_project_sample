require 'rails_helper'

RSpec.describe JobListingsController, type: :controller do

  describe 'GET #index' do

    # Set up
    let(:user) { create(:user) }
    let!(:job_listings) { create_list(:job_listing, 3, user: user) }

    # Preparation
    before { get :index }

    # Assertion
    # without colon refers to the job_listings in let!(:job_listings)
    # with colon refers to the instance variable @job_listings in the controller
    it { expect(assigns(:job_listings)).to eq(job_listings) }

    # Teardown - clearing of database
    # take care of by Rspec

  end

  describe 'GET #show' do

    let(:job_listing) { create(:job_listing) }

    before { get :show, params: { id: job_listing } }

    it { expect(assigns(:job_listing)).to eq(job_listing)}

  end

  describe 'GET #new' do

    before { get :new }

    it { expect(assigns(:job_listing)).to be_a_new_record }

  end

  describe 'POST #create' do

    let(:user) { create(:user) }

    before do
      sign_in user
      post :create, params: { job_listing: params}
    end

    context 'when user#save passes' do
      let(:params) { attributes_for(:job_listing)}

      it { expect(response).to redirect_to job_listings_path }
    end

    context 'when user#save fails' do
      let(:params) { attributes_for(:job_listing, :invalid) }

      it { expect(response).to render_template(:new) }
    end



  end



end
