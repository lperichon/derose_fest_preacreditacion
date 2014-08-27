class Ability
  include CanCan::Ability

  def initialize(user)
  	user ||= User.new # guest user (not logged in)
  	
    cannot :manage, :all

    if user.username == 'yael.barcesat' || user.username == 'mariela.dossena' || user.username == 'luis.perichon'
      can :manage, :all
    end
    
  end
end
