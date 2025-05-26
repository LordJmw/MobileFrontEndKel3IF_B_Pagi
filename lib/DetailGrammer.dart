import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final Widget content;

  const DetailScreen({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, 
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.left, 
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Divider(color: Colors.grey),
                      const SizedBox(height: 12),
                      content,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget PartsOfSpeechContent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Parts of Speech Overview',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 12),
      const Text(
        'Parts of speech are the categories of words based on their function within a sentence. Understanding these categories helps in constructing grammatically correct sentences and improving language skills.',
        style: TextStyle(fontSize: 16, height: 2, color: Colors.black),
      ),
      const SizedBox(height: 16),
      const Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Text(
          '1. Noun',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
      const Text(
        'A noun is a word that represents a person, place, thing, or idea.\nExamples: dog, city, love, John',
        style: TextStyle(fontSize: 16, height: 2, color: Colors.black),
      ),
      const SizedBox(height: 12),
      const Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Text(
          '2. Verb',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
      const Text(
        'A verb expresses action or a state of being.\nExamples: run, is, think, eat',
        style: TextStyle(fontSize: 16, height: 2, color: Colors.black),
      ),
      const SizedBox(height: 12),
      const Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Text(
          '3. Adjective',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
      const Text(
        'An adjective describes or modifies a noun.\nExamples: big, happy, blue, tall',
        style: TextStyle(fontSize: 16, height: 2, color: Colors.black),
      ),
      const SizedBox(height: 12),
      const Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Text(
          '4. Adverb',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
      const Text(
        'An adverb modifies a verb, adjective, or another adverb, often ending in -ly.\nExamples: quickly, very, quietly, always',
        style: TextStyle(fontSize: 16, height: 2, color: Colors.black),
      ),
      const SizedBox(height: 16),
      Card(
        elevation: 2,
        color: Colors.blue[50],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Example Sentence',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'The quick brown fox (noun) jumps (verb) gracefully (adverb) over the tall (adjective) fence.',
                style: TextStyle(fontSize: 15, height: 2, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget ArticlesContent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Understanding Articles',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      const SizedBox(height: 12),
      const Text(
        'Articles are words that define a noun as specific or unspecific. English has three articles: "a," "an," and "the."',
        style: TextStyle(fontSize: 16, height: 2, color: Colors.black),
      ),
      const SizedBox(height: 16),
      const Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Text(
          '1. Definite Article: The',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
      const Text(
        'Used to refer to specific nouns that are known to the reader or listener.\nExample: The sun rises in the east.',
        style: TextStyle(fontSize: 16, height: 2, color: Colors.black),
      ),
      const SizedBox(height: 12),
      const Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Text(
          '2. Indefinite Articles: A/An',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
      const Text(
        'Used for non-specific nouns. Use "a" before consonant sounds and "an" before vowel sounds.\nExamples: A dog is loyal. An apple is red.',
        style: TextStyle(fontSize: 16, height: 2, color: Colors.black),
      ),
      const SizedBox(height: 16),
      Card(
        elevation: 2,
        color: Colors.blue[50],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Example Usage',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'I saw a cat in the garden. The cat was chasing an insect.',
                style: TextStyle(fontSize: 15, height: 2, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget ToBeContent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'The Verb "To Be"',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      const SizedBox(height: 12),
      const Text(
        'The verb "to be" is one of the most important verbs in English, used to describe states, identities, and characteristics.',
        style: TextStyle(fontSize: 16, height: 2, color: Colors.black),
      ),
      const SizedBox(height: 16),
      const Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Text(
          'Forms of "To Be"',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
      const Text(
        '- Present: am, is, are\n- Past: was, were\n- Future: will be\n- Present Participle: being\n- Past Participle: been',
        style: TextStyle(fontSize: 16, height: 2, color: Colors.black),
      ),
      const SizedBox(height: 12),
      const Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Text(
          'Usage',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
      const Text(
        '1. To describe identity: She is a teacher.\n2. To describe states: They are happy.\n3. As an auxiliary verb: He is running.',
        style: TextStyle(fontSize: 16, height: 2, color: Colors.black),
      ),
      const SizedBox(height: 16),
      Card(
        elevation: 2,
        color: Colors.blue[50],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Example Sentences',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'I am a student. They were tired yesterday. She is being helpful.',
                style: TextStyle(fontSize: 15, height: 2, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
