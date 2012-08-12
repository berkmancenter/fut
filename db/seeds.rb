Question.create(:content => "Purpose of the new work", :explanation => "What will your new piece of work be used for?")
Question.create(:content => "Character of the new work", :explanation => "How can you describe the character of the new work?")
Question.create(:content => "Use of the original work in the new work", :explanation => "How will the original work be used in the new work?")
Question.create(:content => "Nature of the original work", :explanation => "What features best describe the original work?")
Question.create(:content => "Amount of the original work being used", :explanation => "How much of the original work are you including in your remix?")
Question.create(:content => "Financial impact of the new work", :explanation => "How will the new work affect the financial success of the original?")
Answer.create(:content => "Criticism", :value => 1, :question_id => 1, :explanation => "A judgment, evaluation, or interpretation of another person's actions, works, or ideas, usually expressing an opposing viewpoint. Ex. Opinion column in newspaper")
Answer.create(:content => "Commentary", :value => 1, :question_id => 1, :explanation => "A series of explanations or descriptions that adds on to an event or occurrence as it is happening. Ex. Sports commentary")
Answer.create(:content => "News Reporting", :value => 1, :question_id => 1, :explanation => "A collection of images, text, and video that can be used to report on current events or historical events. Ex. Online news broadcast	")
Answer.create(:content => "Teaching", :value => 1, :question_id => 1, :explanation => "To be used as a teaching and learning tool for peers about a certain topic or issue. Ex. History project presentation")
Answer.create(:content => "Scholarship", :value => 1, :question_id => 1, :explanation => "Promoting knowledge in order to emphasize academic accomplishments[1] for the most valid and trustworthy sharing of information.")
Answer.create(:content => "Research", :value => 1, :question_id => 1, :explanation => "To investigate and formulate questions based on a certain topic or issue.")
Answer.create(:content => "Personal Copy", :value => 1, :question_id => 1, :explanation => "The original work will be used for your own personal interest and enjoyment and will not be shared or changed without permission of the original author.")
Answer.create(:content => "Other", :value => 0, :question_id => 1)
Answer.create(:content => "Commerical", :value => -1, :question_id => 2, :explanation => "Will be used in order to advertise or promote a product for sale and financial gain.")
Answer.create(:content => "Non-Commerical", :value => 1, :question_id => 2, :explanation => "For use without monetary benefit or to promote a product.")
Answer.create(:content => "Transformation", :value => 1, :question_id => 3, :explanation => "The original work will be remixed, mashed up, or changed in any way.")
Answer.create(:content => "Parody", :value => 1, :question_id => 3, :explanation => "To use an original work in order to make fun of a serious issue or social commentary.")
Answer.create(:content => "Neither Transform Nor Parody", :value => -1, :question_id => 3)
Answer.create(:content => "Published and Not Creative", :value => 1, :question_id => 4, :explanation => "The original work was prepared, issued, and edited for public sale and it expresses ideas and concepts which are neither original nor unique to the artist.")
Answer.create(:content => "Published and Creative", :value => 0, :question_id => 4, :explanation => "The original work was prepared, issued, and edited for public sale and it expresses ideas which are original and unique to the artist.")
Answer.create(:content => "Unpublished and Not Creative", :value => 0, :question_id => 4, :explanation => "The original work was not released for public consumption and is likely an unfinished project and it expresses ideas and concepts which are neither original nor unique to the artist.")
Answer.create(:content => "Unpublished and Creative", :value => -1, :question_id => 4, :explanation => "The original work was not released for public consumption and is likely an unfinished project and it expresses ideas which are original and unique to the artist.")
Answer.create(:content => "Most of it", :value => -1, :question_id => 5, :explanation => "The majority of the original work (same phrasing, words, sounds) is included in the new work.")
Answer.create(:content => "Just the essential parts", :value => -1, :question_id => 5, :explanation => "The main points made by the original creator are included in the new work, though the phraseology is not the same.")
Answer.create(:content => "Most and essential parts", :value => -1, :question_id => 5, :explanation => "The new work includes the majority of the phrasing, words, sounds, and ideas presented in the original.")
Answer.create(:content => "Neither most nor essential", :value => 1, :question_id => 5)
Answer.create(:content => "Damages current potential market", :value => -1, :question_id => 6, :explanation => "The new work could be interesting to the same consumer base as the original as a substitute goods, thereby drawing potential buyers away from the work and ruining its' potential market position.")
Answer.create(:content => "Doesn't Damages market", :value => 1, :question_id => 6, :explanation => "The new work performs a different function than the original and is not intended for the same purposes - as a result, the market position of the original work is not affected and remains in tact.")
Role.create(:name => "Writer")
Role.create(:name => "Photo Filmmaker")
Role.create(:name => "Artist")
Role.create(:name => "DJ")
Role.create(:name => "Detective")
#Hope Poster
Attachment.create(:name => "Associated Press Obama", :url => "http://dl.dropbox.com/u/33588915/Legal%20Cases%20Photos/Obama.jpeg")
Attachment.create(:name => "Obama Hope Poster", :url => "http://dl.dropbox.com/u/33588915/Legal%20Cases%20Photos/Obama%20Hope%20Poster.jpeg")
LegalCase.create(:title => "Shepard Fairey Hope",
	:facts =>"Fairey's now-iconic 'Hope' image featuring President Barack Obama transformed an Associated Press photograph of the then candidate into a campaign poster.  Fairey's purpose in appropriating the image was to comment on the presidential election. Fairey's 'Hope' poster transforms the original photograph into a stylized image of Obama, using a red, white and blue color palette, and tagging the image with the word 'Hope' to convey a political message. Featured in numerous publications, the Associate Press photograph clearly was a published work.  Although news photography of this type involves some creative decision-making on the part of the photographer, the Obama image is not as creative as, say, an abstract painting or even an artistic portrait.  The news photographer likely had only one angle from which to take the shot, and Obama necessarily would have to be the focal point of the photograph.  Lighting and other such concerns presumably were not adjustable, given that the picture was taken at what appears to be a news conference",
	:original_resource_id => 1,
	:derivative_resource_id => 2)
TestAnswer.create(:target_type => "LegalCase", :target_id => 1, :purpose_id => 2, :character_id => 9 , :use_id => 11 , :nature_id => 14 , :amount_id => 18 , :financial_id => 23 , :result => nil )
CourtDecisionDetail.create(:legal_case_id => 1,
	:purpose => "Fairey's now-iconic 'Hope' image featuring President Barack Obama transformed an Associated Press photograph of the then candidate into a campaign poster. Fairey's purpose in taking the image was to comment on the presidential election. His purpose receives a green light.",
    :character => "Considering the potential use of the poster for campaign purposes, possible sales of Fairey's image, revenue generated through gallery shows, and other licensing opportunities, Fairey's work clearly has commercial applications.  The character receives a red light.",
    :use => "Fairey's 'Hope' poster transforms the original photograph into a stylized image of Obama, using red, white and blue colors, and tagging the image with the word 'Hope' to convey a political message.  Because the use changes it greatly from the original, it receives a green light.",
    :nature => "Lighting and other such concerns were most likely unable to be adjusted, given that the picture was taken at what appears to be a news conference.  On the whole, the nature of the work receives a green light, with the qualification that it is a 'weaker green' than it would be if the work was purely factual.",
    :amount => "Fairey's use receives a red light under this factor because he uses the entire Associated Press image.",
    :financial => "It is not clear that such a market, or the potential for such a market, exists. Fairey's work could receive a red light or a green light under this factor.  The work does not harm the market for work that imitates the original, as the AP is not in the practice of turning its photographs into artistic images.")
LegalCase.last.roles << [Role.find(2),Role.find(4)]
#Harry Potter
Attachment.create(:name => "Warner Bros", :url => "http://dl.dropbox.com/u/33588915/Legal%20Cases%20Photos/Warner%20Bros%20logo.png")
Attachment.create(:name => "Hogwarts coat of arms", :url => "http://dl.dropbox.com/u/33588915/Legal%20Cases%20Photos/Hogwarts%20coat%20of%20arms.png")
LegalCase.create(:title => "Warner Bros vs RDR Books",
	:facts =>"In what has come to be known as the Harry Potter Lexicon case, the court held that a reference guide to the Harry Potter series, the 'Harry Potter Lexicon', infringed upon series author J.K. Rowling's copyrights, and did not constitute a fair use of material from her books.  The creators of The Harry Potter Lexicon created a guide of some 2,400 entries explaining various aspects of the fiction world of Harry Potter.  The idea for the book came following the success of a popular Harry Potter fan site, which was a preliminary, online version of the Lexicon RDR Books sought to publish.  The website received favorable feedback from Rowling herself.The website's creator had, himself, expressed uncertainty as to the legality of ever publishing his online encyclopedia in print form.  However, he was persuaded by RDR Books to go through with publication.  The plan was to have the book out by late October 2007, to capitalize on the fervor over the final book of the series.  When Warner Bros. learned of RDR's intent, it sent several letters requesting that the company delay publishing until the two could work out any legal issues in good faith.  However, RDR both refused to delay publication and to provide Warner Bros. with a Lexicon manuscript.  On October 31, 2007, Warner Bros. brought suit and requested a preliminary injunction to halt publication.",
	:original_resource_id => 3,
	:derivative_resource_id => 4)
TestAnswer.create(:target_type => "LegalCase", :target_id => 2, :purpose_id => 6 , :character_id => 9 , :use_id => 11 , :nature_id => 15 , :amount_id => 20 , :financial_id => 22 , :result => false)
CourtDecisionDetail.create(:legal_case_id => 2,
	:purpose => "The purpose of the Lexicon was to make 'information about the intrinsic world of Harry Potter readily accessible to readers in a reference guide'  (43 of Slip Opinion).  'Intrinsic' means the innermost nature.  As a result, it serves an informational, indeed, an educational purpose.  This receives a green light under the first factor.",
    :character => "The Lexicon was commercial in nature, taking unfair advantage of the uncontrollable success of the Harry Potter series to create a new product that would appeal to the many and various faithful fans of Rowling's books.  A stated selling point was that it would be the first guide to the Harry Potter series to cover all seven novels.  This factor receives a red light.",
    :use => "While the purpose of the original Harry Potter series is to entertain, the Lexicon seeks to document and explain the 'realities' of Harry Potter's world. 'Because it serves [a reference purpose], rather than the entertainment and aesthetic purposes of the original works, the Lexicon's use is transformative'  'Aesthetic' means highly pleasing to look at.  This factor receives a green light.",
    :nature => "Rowling's series is published but highly creative.  Thus, the nature of the copyrighted work results in a 1/2 green, 1/2 red ruling.",
    :amount => "The Lexicon identified some 2,400 elements from the book series.  The court considered it 'reasonably necessary' for the Lexicon to use a 'considerable' amount of copyrighted material to effect its purpose as a reference guide.  However, the court considers the guide's exact copying of what the court regards as highly creative expression to be a strike against fair use.  The court notes that while in some Lexicon definitions, using short pieces of writings from the book takes a reasonable amount of material, in others it appropriates an unnecessary amount of expressive language from the text.  This factor may be said to weigh against a finding of fair use, and receives a red light.",
    :financial => "The court notes that the market for Harry Potter reference guides is not solely J.K. Rowling's to unfairly take advantage of.  It concludes that publishing the Lexicon would not cause harm to Rowling's series of novels.  However, it does feel publication would impact sales of Rowling's companion books to the series.  These books also provide insights into and extra rare parts of the Harry Potter world.  Publication may also harm the future licensing of items such as the songs and poems that appear in the novels, because the Lexicon reproduces these exactly without having license.  This factor earns a red light.")
LegalCase.last.roles << [Role.find(1),Role.find(2)]
#Blanch v. Koons
Attachment.create(:name => "Blanch v Koons", :url => "http://dl.dropbox.com/u/33588915/Legal%20Cases%20Photos/Blanch%20v%20Koons%20appropriated%20photo.jpg")
Attachment.create(:name => "Summer Sunshine", :url => "http://dl.dropbox.com/u/33588915/Legal%20Cases%20Photos/Summer%20Sunshine.jpg")
LegalCase.create(:title => "Blanch vs Koons",
	:facts =>"In Blanch v. Koons, 467 F.3d 244 (2d Cir. 2006), the court held that appropriation artist Jeff koons' ''Niagara' made fair use of photographer Andrea Blanch's image 'Silk Sandals by Gucci.'  Koons combined the photograph, which had been featured in Allure magazine, with other images to create an original collage piece. Applying the four part test described in Section 107 of the Copyright Act, the court found Koons' use of the photograph to be sufficiently transformative.  The artwork did not impact the value of the original photograph, and by Blanch's own testimony, the use did not 'cause any harm' to Blanch's career. Blanch, 467 F.3d at 258.",
	:original_resource_id => 5,
	:derivative_resource_id => 6 )

TestAnswer.create(:target_type => "LegalCase", :target_id => 3, :purpose_id => 2 , :character_id => 9 , :use_id => 11 , :nature_id => 15 , :amount_id => 20 , :financial_id => 23, :result => true )
CourtDecisionDetail.create(:legal_case_id => 3,
	:purpose => "Koons' intended 'Niagara' as commentary on 'the ways in which some of our most basic appetites are mediated by popular images.' Blanch, 467 F.3d at 247.  The court compared Koons' appropriation of the photograph to the taking of 'raw material' for use in a creative work.  Koons' incorporation of the photograph was considered justified by a 'creative rationale,' rather than done simply 'to get attention' or to recycle someone else's ideas.  'Incorporation' means to unite or work into something already existent so as to form an indistinguishable whole.  The purpose receives a green light.",
    :character => "While Koons profited substantially from the sale of 'Niagara,' the court did not allow this factor to weigh heavily in its analysis, claiming the commercial viability of the work did not cause its public benefit as viewable art to be ineffective or invalid. Thus, while this factor receives a red light under our analysis, it is important to note the court's election not to afford this factor much weight.",
    :use => "Koons incorporated the image into a painted collage of media images.  While a change in the type of media does not alone make a use transformative, Koons appropriation of the image changed the image's purpose and message.  By combining it with additional images and original elements, Koons transformed an editorial photograph into part of a work commenting on 'the social and aesthetic consequences' of popular media. Blanch, 467 F.3d at 253.   This factor receives a green light.",
    :nature => "The original photograph was published and creative.  Thus, it receives 1/2 of a red light and 1/2 of a green light under our framework.",
    :amount => "Koons appropriated most of Blanch's photograph, although background elements including a magazine and part of an airplane cabin were left out of Koons' reproduction.  The legs clearly were the centerpiece of Blanch's photograph, meaning Koons' took both most of and the essential parts of the original piece.  'Niagara' receives a red light under this factor.",
    :financial => "The court found that 'Niagara' caused (?) no negative market effect on Blanch's original work.  Koons piece did not serve as a replacement for the original, nor did it impact the potential market for further distribution and use of Blanch's photograph.  She admitted to never having licensed her photographs for use in art, nor has she licensed or published the photograph in question prior to its appearance in Allure.  Blanch's own admission that Koons' use had not impacted the market for her work or her reputation as an artist reasonably assumed to weigh heavily in the court's finding that Koons' use had no impact of the original's worth.  Thus, the final factor receives a green light under our analysis.")
LegalCase.last.roles << Role.find(3)
#Sony
Attachment.create(:name => "Sony Crop", :url => "http://dl.dropbox.com/u/33588915/Legal%20Cases%20Photos/Sony-logo.jpg")
Attachment.create(:name => "Universal Studio", :url => "http://dl.dropbox.com/u/33588915/Legal%20Cases%20Photos/universal-studio-logo.jpg")
LegalCase.create(:title => "Sony Corp vs Universal Studios",
	:facts =>"The 'time-shifting' of television programs made possible by Betamax technology was considered a legitimate purpose under fair use analysis.  Even though making personal copies for time-shifting purposes is not an enumerated purpose within 17 U.S.C. Although Betamax technology permitted users to reproduce copyrighted programs, the copies were not intended for sale or other revenue-generating uses. Making personal copies for private home viewing is a non-commercial use. The television programs clearly were published, as they had to be broadcast for the recording to take place.  However, television programs, arguably, all involve some degree of creativity.  In some cases, such as news footage of an event, the creative aspects may be very limited.  However, it is likely that the vast majority of the copyrighted works being recorded were scripted programs and broadcast movies, programs that contain a significant amount of creative content. ",
	:original_resource_id => 7,
	:derivative_resource_id => 8 )
TestAnswer.create(:target_type => "LegalCase", :target_id => 4, :purpose_id => 7 , :character_id => 10 , :use_id => 13 , :nature_id => 15 , :amount_id => 19 , :financial_id => 23, :result => true )
CourtDecisionDetail.create(:legal_case_id => 4,
	:purpose => "The 'time-shifting' of television programs made possible by Betamax technology was considered a legitimate purpose under fair use analysis.  Time-shifting is the recording of programs to DVRs, DVDs, etc. for viewing at a more convenient time. Betamax was a competitor to VHS video tapes to record TV programs. Even though making personal copies for time-shifting purposes is not a listed purpose within 17 U.S.C. 107, it still receives a green light.  The purpose was also regarded as serving the public interest by increasing access to programming (425).",
    :character => "Although Betamax technology permitted users to reproduce copyrighted programs, the copies were not intended for sale or other revenue-generating uses.  Making personal copies for private home viewing is a non-commercial use.  This factor receives a green light.",
    :use => "The use of the work has not been transformed greatly from the original.  An identical reproduction of a copyrighted work was being made for time-shifting purposes.  The substance of the original content remained unaltered.  Thus, the use of the copyright work triggers a red light.",
    :nature => "The television programs clearly were published, as they had to be broadcast for the recording to take place.  However, television programs, arguably, all involve some degree of creativity.  In some cases, such as news footage of an event, the creative aspects may be very limited.  However, it is likely that the vast majority of the copyrighted works being recorded were scripted programs and broadcast movies, programs that contain a significant amount of creative content.  The nature of the work is thus half-green, half-red.",
    :amount => "Betamax users generally were recording the entirety of copyrighted programs.  Even if they were recording only a segment of a program, the recording presumably would be targeting the 'heart' of a particular segment.  For example, if a user recorded one of the stories featured on Dateline NBC, a news show focusing on crime, celebrity and health, he or she would still be capturing an 'essential' part of the program.  This factor seemingly earns a red light.  However, the Court noted that because the work had already been made freely available to the public in its entirety, the fact that the entire work was copied did not weigh against fair use (449).",
    :financial => "Television studios had several avenues available through which to profit from their programs.  However, since Betamax users were recording programs for personal, non-commercial use, the Court required the studios to demonstrate the likelihood of harm to the market (451).  The Supreme Court agreed with the District Court's dismissal of alleged market harms -- including the reduction of viewing audiences for both live programs and reruns, and a decrease in movie rentals -- as hypothetical.  'Testimony suggested that Betamax may require adjustments in marketing strategy, but it did not establish even a likelihood of harm' (453-54).  The use receives a green light for lack of market impact.")
LegalCase.last.roles << [Role.find(2),Role.find(4)]