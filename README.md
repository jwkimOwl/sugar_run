# What is Sugar Run?

Sugar Run is an engaging nutrition education and meal-tracking game designed to help children make healthier food choices while building awareness of Type 2 diabetes risk factors. It also supports individuals with dietary restrictions and disabilities by making nutritional information more accessible. The main interface allows users to select foods from a text-based menu, and our backend calculates the total sugar intake, nutritional values, and assigns a health score variable using a Glycemic Index (GI) formula (which measures how much a food raises blood sugar levels). The app provides instant feedback with a simple **green (healthy choice), yellow (moderate choice), and red (high-sugar, less healthy choice) color-coded system**, making it easy for kids to understand how their meal choices impact their health.

Other features include a **scoreboard system** to keep users engaged and motivated, an **educational lesson page on diabetes**, and **rewards and prizes** to encourage long-term healthy habit formation.


## Inspiration

As we brainstormed, we discussed how we all have family members or people we know who have been affected by diabetes. This prompted the question: **why weren't we taught how to make healthy food choices as kids?** Some of our parents had diabetes, yet they never truly taught us about the importance of a balanced diet. Sure, adults told us what to eat, but without real guidance or interactive learning, the lessons didn’t stick. Simply being told what’s “good” or “bad” isn’t enough. We identified that kids need **hands-on, engaging experiences** to truly understand the impact of their food choices.

This inspired us to create **Sugar Run**: a **fun, interactive program** geared toward **children ages 5-12**, making **nutrition education accessible, engaging, and effective**. However, we believe that learning about diabetes and nutrition **has no age limit**, so our age range is simply a suggestion.

Many kids struggle to understand **nutrition labels and the effects of sugar intake**, making it difficult for them to make informed choices. Meanwhile, **most food-tracking apps are designed for adults**, making them too complex and unappealing for young users, often leaving kids feeling isolated or controlled by their disability. Furthermore, **childhood Type 2 diabetes rates have surged** in recent years, emphasizing the urgent need for **early education on how dietary choices influence long-term health**.  

Lack of information **not only affects children with diabetes**, but also **those without it**, who—without guidance on food nutrition—develop **dangerous habits** that increase their risk of Type 2 diabetes and other health issues.

Sugar Run fills this gap by **transforming nutrition education into a game**—making it **fun, easy to understand, and rewarding**—while also **reducing stigma about diabetes and food nutrition**. Through **interactive meal selection, real-time feedback with a points system, and gamified learning**, kids can build **lifelong healthy habits**!


## Key Problems We Address

1. **Nutrition education is not designed for kids**—labels are confusing, and most food apps are built for adults.
2. **Existing food-tracking tools lack engagement**—they are overwhelming, data-heavy, and fail to connect with young users in an interactive way.
3. **Early education on dietary habits is critical**—with childhood Type 2 diabetes on the rise, kids need practical, interactive tools to help them stay engaged in healthy eating habits.


## How We Built It

- **Figma** – Designed an interactive iOS app mockup to ensure a user-friendly experience and clear pathway for building the iOS app in Flutter.
- **Flutter.js (Dart)** – Used as our IDE to build a responsive, interactive iOS app.
- **Custom Mascot Design** – Implemented a unique mascot with multiple colors, integrating it into different parts of the app.
- **NutritionIX API** – Used for our food selection menu.
- **Glycemic Index Formula** – Developed a custom calculation formula.
- **Scoreboard System** – Created to track progress and encourage engagement.


## Challenges We Ran Into

- **Accurate Nutritional Data** – Finding reliable sources for Glycemic Index values and nutritional breakdowns required extensive cross-referencing of multiple databases.
- **First-Time Flutter Usage** – None of us had used Flutter before. Our main programmers had different devices, and Flutter didn’t work well with Windows, forcing us to shift our plans. Learning Dart was also a challenge, but previous experience with Java helped us adapt.
- **Optimizing the Scoring Algorithm** – Balancing sugar intake, GI, and overall health impact while making the app engaging and fair for kids required multiple iterations.


## Accomplishments We’re Proud Of

This is our **very first hackathon** for all team members, and we couldn’t be more proud! We’ve learned to **collaborate, adapt, and problem-solve** to create a working app that we believe can **make a huge impact on health accessibility**.


## What We Learned

- **Game Design for Health Education** – Balancing **fun and learning** to engage young users effectively.
- **Optimizing Glycemic Index Formulas** – Researching **blood sugar response calculations** for meal scoring.
- **Using NutritionIX API** – Learning how to integrate **real-world nutritional data** into our app.
- **Time Management & Teamwork** – Balancing **design and API implementation** rather than sacrificing one aspect of the app.
- **Flutter & Dart Development** – Gaining experience in **building an iOS app** using Flutter IDE.


## What’s Next for Sugar Run

- **Fully Implement Sugar Run as an Interactive, Incentivized App** – To help users track food habits and make healthy choices.
- **Enhance the Game Element** – One of our members has a strong background in video game development, and we want to leverage that expertise to expand Sugar Run’s game mechanics.
- **Expand the Food Database** – Although we implemented the **NutritionIX API**, the food database still has limitations. Our goal is to **create our own food database** or integrate additional APIs.
- **AI-Powered Food Suggestions** – Implementing **smart meal recommendations** based on dietary habits.
- **Multiplayer & Social Features** – Creating an **online leaderboard** so kids can **compete with friends** in a fun, health-conscious way.
- **Partnering with Schools**

