module ActiveBugzilla
  class Flag < Base
    attr_reader :active, :bug_id, :created_on, :id, :name, :setter, :requestee, :status, :type_id, :updated_on
    alias_method :active?, :active

    def initialize(attributes)
      @id         = attributes['id']
      @bug_id     = attributes['bug_id']
      @type_id    = attributes['type_id']
      @created_on = normalize_timestamp(attributes['creation_date'])
      @updated_on = normalize_timestamp(attributes['modification_date'])
      @status     = attributes['status']
      @name       = attributes['name']
      @setter     = attributes['setter']
      @active     = attributes['is_active']
      @requestee  = attributes['requestee']
    end

    def self.instantiate_from_raw_data(data, bug_id = nil)
      data.collect { |hash| new(hash.merge('bug_id' => bug_id)) }
    end
  end
end
