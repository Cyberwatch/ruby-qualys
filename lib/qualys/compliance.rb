module Qualys
  class Compliance < Api
    def self.all
      response = api_get('/compliance/control/', query: { action: 'list' })

      unless response.parsed_response['<COMPLIANCE_SCAN_RESULT_OUTPUT']['RESPONSE'].key? 'COMPLIANCE_SCAN'
        return []
      end

      response.parsed_response['COMPLIANCE_SCAN_RESULT_OUTPUT']['RESPONSE']['COMPLIANCE_SCAN']
    end

    def self.each
      all
    end
  end
end
