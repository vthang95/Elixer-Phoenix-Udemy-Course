defmodule Cards do
  @moduledoc """
    Provides methods for create and handle dock
  """

  def create_deck do
    values = ["Ace", "two", "three", "four", "five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle_deck(deck) do
    Enum.shuffle(deck)
  end


  @doc """
    Determines whether the deck contains the card

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Provides function to create a hand deck of cards

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, _rest_of_deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def create_hand_deck(splited_deck) do
    { hand_deck, rest_of_deck } = splited_deck
    hand_deck
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      { :ok, binary } -> :erlang.binary_to_term binary
      { :error, _reason } -> "that file is not exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle_deck
    |> Cards.deal(hand_size)
    |> Cards.create_hand_deck()
  end

  def test do
    arr1 = [1, 2, 3]
    arr2 = [3, 4, 5]

    { arr1, arr2 } = { ["red"], ["blue"] }

    arr1
  end
end
