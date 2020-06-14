class Customer < ApplicationRecord
    enum status: [ :Prospective, :Current, :NonActive ]
    has_many :note

    # def as_json(**options)
    #     unless options.has_key? :include
    #       options.merge!(include: [:note])
    #     end
    #     super(options)
    # end
end