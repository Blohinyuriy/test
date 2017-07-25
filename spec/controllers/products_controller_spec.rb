require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe '#index' do
    before { process :index, method: :get, format: :json }

    it { should render_template :index }
  end

  describe '#create' do
    let(:params) { { name: 'bred' } }

    let(:product) { stub_model Product }

    before { expect(Product).to receive(:new).with(permit! params).and_return(product) }

    before { expect(product).to receive(:save!) }

    before { process :create, method: :post, params: params, format: :json }

    it { should render_template :create }
  end

  describe '#collection' do
    context do
      before { expect(Product).to receive(:all).and_return(:collection) }

      its(:collection) { should eq :collection }
    end
  end
end




