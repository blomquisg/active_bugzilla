module ActiveBugzilla
  class Flag < Base
    attr_reader :active, :bug_id, :created_on, :id, :name, :setter, :requestee, :status, :type_id, :updated_on
    alias_method :active?, :active

    def initialize(attributes)
      @attributes = attributes.dup
      @attributes['created_on'] = normalize_timestamp(@attributes.delete('creation_date'))
      @attributes['updated_on'] = normalize_timestamp(@attributes.delete('modification_date'))

      @id         = @attributes['id']
      @bug_id     = @attributes['bug_id']
      @type_id    = @attributes['type_id']
      @created_on = @attributes['created_on']
      @updated_on = @attributes['updated_on']
      @status     = @attributes['status']
      @name       = @attributes['name']
      @setter     = @attributes['setter']
      @active     = @attributes['is_active']
      @requestee  = @attributes['requestee']
    end

    def attributes
      @attributes
    end

    def self.instantiate_from_raw_data(data, bug_id = nil)
      data.collect { |hash| new(hash.merge('bug_id' => bug_id)) }
    end
  end
end
