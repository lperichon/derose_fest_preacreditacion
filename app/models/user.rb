class User < ActiveRecord::Base
  attr_accessible :username, :current_account_id
  devise :cas_authenticatable

  belongs_to :current_account, class_name: "Account", foreign_key: "current_account_id"

  validates_uniqueness_of :username
  validates_presence_of :username

  has_many :deals, foreign_key: :local_user_id

  include Accounts::IsAUser

  # Accounts::IsAUser needs class to respond_to account_name
  def account_name
    self.current_account.try :name
  end

  # Accounts::IsAUser needs class to respond_to account_name=
  def account_name=(name)
    self.current_account = Account.find_by_name(name)
  end

  # Accounts::IsAUser needs class to respond_to account_name_changed?
  def account_name_changed?
    self.current_account_id_changed?
  end
end
