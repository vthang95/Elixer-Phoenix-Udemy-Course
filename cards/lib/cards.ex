defmodule Cards do
  def createDeck do
    values = ["Ace", "two", "three", "four", "five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffleDeck(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, handSize) do
    Enum.split(deck, handSize)
  end

  def showHandDeck(splitedDeck) do
    { handDeck, restOfDeck } = splitedDeck
    handDeck
  end

  def save(deck, fileName) do
    binary = :erlang.term_to_binary(deck)
    File.write(fileName, binary)
  end

  def load(fileName) do
    case File.read(fileName) do
      { :ok, binary } -> :erlang.binary_to_term binary
      { :error, _reason } -> "that file is not exist"
    end
  end

  def test do
    arr1 = [1, 2, 3]
    arr2 = [3, 4, 5]

    { arr1, arr2 } = { ["red"], ["blue"] }

    arr1
  end
end
