require 'rails_helper'

RSpec.describe PenguinsController, type: :controller do

  describe 'GET #index' do
    # Set Up
    let(:penguins) { create_list(:penguin, 3) }
    # Preparation
    before { get :index }
    # Assertion
    it { expect(assigns(:penguins)).to eq(penguins) }
  end

  describe 'GET #show' do
    let(:penguin) { create(:penguin) }

    before { get :show, params: { id: penguin }}

    it { expect(assigns(:penguin)).to eq(penguin)}
  end

  describe 'GET #new' do

    before { get :new }

    it { expect(assigns(:penguin)).to be_a_new_record }
  end

  describe 'POST #create' do



    before { post :create, params: { penguin: params } }

    context 'when user#save passes' do
      let(:params) { attributes_for(:penguin) }

      it { expect(response).to redirect_to penguins_path }
    end

    context 'when user#save fails' do
      let(:params) { attributes_for(:penguin, :invalid) }

      it { expect(response).to render_template(:new)}
    end


  end


end
