class Participant < ActiveRecord::Base

  attr_accessor :account_name

  attr_accessible :first_name,
                  :last_name,
                  :email,
                  :local_account_id,
                  :identification,
                  :account_name

  belongs_to :account, foreign_key: :local_account_id
  validates_presence_of :account, :first_name, :last_name, :identification, :email, :account_name

  before_validation :set_account

  def self.query(query_string)
    if query_string.blank?
      self.scoped
    else
      query_string = "%#{query_string}%"
      business_ids = Participant.where("first_name like :query OR last_name like :query OR identification = :query OR email like :query", {ids: business_ids, query: query_string})
    end
  end

  private

  def set_account
    self.account = Account.find_or_create_by_name(:name => self.account_name) if @account_name
  end


end
