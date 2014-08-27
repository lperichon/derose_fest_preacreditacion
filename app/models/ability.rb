class Ability
  include CanCan::Ability

  def initialize(user)
    cannot :manage, :all

    if user.username == 'yael.barcesat' || user.username == 'mariela.dossena' || user.username == 'luis.perichon'
      can :manage, :all
    end
    
  end
end
