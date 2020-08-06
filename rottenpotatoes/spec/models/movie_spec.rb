require 'rails_helper'

describe Movie do
  before(:each) do
    @movie1 = Movie.create!(title: 'Little Women', director: 'Greta Gerwig')
    @movie2 = Movie.create!(title: 'Titanic', director: 'James Cameron')
    @movie3 = Movie.create!(title: 'Lady Bird', director: 'Greta Gerwig')
    @movie4 = Movie.create!(title: 'Endgame')
  end
  
  describe '.find_similar_movies' do
    #let!(:movie1) { FactoryGirl.create(:movie, title: 'Little Women', director: 'Greta Gerwig') }
    #let!(:movie2) { FactoryGirl.create(:movie, title: 'Titanic', director: 'James Cameron') }
    #let!(:movie3) { FactoryGirl.create(:movie, title: 'Lady Bird', director: 'Greta Gerwig') }
    #let!(:movie4) { FactoryGirl.create(:movie, title: 'Endgame') }

    context 'director exists' do
      it 'finds similar movies correctly' do
        expect(Movie.similar_movies(@movie1.title)).to eql(['Little Women', 'Lady Bird'])
        expect(Movie.similar_movies(@movie1.title)).to_not include(['Titanic'])
        expect(Movie.similar_movies(@movie2.title)).to eql(['Titanic'])
      end
    end

    context 'director does not exist' do
      it 'handles sad path' do
        expect(Movie.similar_movies(@movie4.title)).to eql(nil)
      end
    end
  end

  describe '.all_ratings' do
    it 'returns all ratings' do
      expect(Movie.all_ratings).to match(%w(G PG PG-13 NC-17 R))
    end
  end
end