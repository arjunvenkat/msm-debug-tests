require "rails_helper"

feature "DELETE:" do
  scenario "DESTROY: actors#destroy removes a row from the table", points: 1 do
    actor = FactoryGirl.create(:actor)
    starting_count = Actor.count

    visit "/delete_actor/#{actor.id}"

    final_count = Actor.count
    does_row_still_exist = Director.exists?(actor.id)
    expect(starting_count - 1).to eq(final_count)
    expect(does_row_still_exist).to eq(false)
  end
end
