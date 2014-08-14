require 'rails_helper'

describe ProductsController do
  render_views

  let(:product) { create :product }

  before { product }

  describe 'GET index' do
    subject { get :index }

    it 'should not error' do
      expect { subject }.to_not raise_error
    end

    it 'should assign @products' do
      subject
      expect(assigns(:products)).to eq [product]
    end
  end

  describe 'GET show' do
    subject { get :show, params }
    let(:params) { { id: product.id } }

    it 'should not error' do
      expect { subject }.to_not raise_error
    end

    it 'should assign @product' do
      subject
      expect(assigns(:product)).to eq product
    end
  end
end
