require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it "I see the name of all of the snacks associated with that vending machine along with their price" do
    owner = Owner.create(name: "Rhonda's Snacks")
    rhondas  = owner.machines.create(location: "Rhonda's snack machine")
    chips = Snack.create(snack_type: "Lay's Potato Chips", price: 1.25)
    kitkat = Snack.create(snack_type: "KitKat", price: 1.50)
    donuts = Snack.create(snack_type: "Hostess Powdered donuts", price: 2.25)

    rhondas << [chips, kitkat, donuts]

    visit machine_path(rhondas)

    expect(page).to have_content(chips.snack_type)
    expect(page).to have_content(chips.price)
    expect(page).to have_content(kitkat.snack_type)
    expect(page).to have_content(kitkat.price)
    expect(page).to have_content(donuts.snack_type)
    expect(page).to have_content(donuts.price)
  end
end
