class PurchaseOrder < ApplicationRecord
    has_one_attached :invoice
end
