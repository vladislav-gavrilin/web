using NUnit.Framework;

namespace TranslatorTests
{
    [TestFixture]
    public class TranslatorTest
    {
        [TestCase("", null)]
        [TestCase("some", null)]
        [TestCase("book", "книга")]
        [TestCase("книга", "book")]
        public void Translate_ShouldReturnTranslationOrNull(string word, string answer)
        {
            Translator.Translator dictionary = new Translator.Translator("../../../../Translator/dictionary.txt");
            string result = dictionary.Translate(word);
            //Assert
            Assert.AreEqual((answer), result);
        }
    }
}
