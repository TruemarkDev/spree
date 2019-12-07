require 'spec_helper'

describe 'Admin Reports - total sales spec', type: :request do
  stub_authorization!

  let!(:order1) { create(:completed_order_with_totals) }
  let!(:order2) { create(:completed_order_with_totals) }
  let!(:order3) { create(:completed_order_with_totals) }

  before do
    order1.update(completed_at: '2019-11-29', total: 100)
    order2.update(completed_at: '2019-11-28', total: 200)
    order3.update(completed_at: '2019-10-27', total: 350)
  end

  describe 'total_sales#show' do
    before { get '/admin/reports/total_sales.json' }

    let(:json_response) { JSON.parse(response.body) }

    it 'returns 200 HTTP status' do
      expect(response).to have_http_status(:ok)
    end

    it 'return JSON data for charts' do
      expect(json_response['labels']).to eq ['2019-10-27', '2019-11-28', '2019-11-29']
      expect(json_response['data']).to   eq ['350.0', '200.0', '100.0']
    end
  end
end