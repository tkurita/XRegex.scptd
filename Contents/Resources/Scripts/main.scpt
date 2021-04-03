FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �{ Copyright (C) 2020 Kurita Tetsuro

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Foobar is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Foobar.  If not, see <http://www.gnu.org/licenses/>      � 	 	�   C o p y r i g h t   ( C )   2 0 2 0   K u r i t a   T e t s u r o 
 
 T h i s   p r o g r a m   i s   f r e e   s o f t w a r e :   y o u   c a n   r e d i s t r i b u t e   i t   a n d / o r   m o d i f y 
 i t   u n d e r   t h e   t e r m s   o f   t h e   G N U   G e n e r a l   P u b l i c   L i c e n s e   a s   p u b l i s h e d   b y 
 t h e   F r e e   S o f t w a r e   F o u n d a t i o n ,   e i t h e r   v e r s i o n   3   o f   t h e   L i c e n s e ,   o r 
 ( a t   y o u r   o p t i o n )   a n y   l a t e r   v e r s i o n . 
 
 F o o b a r   i s   d i s t r i b u t e d   i n   t h e   h o p e   t h a t   i t   w i l l   b e   u s e f u l , 
 b u t   W I T H O U T   A N Y   W A R R A N T Y ;   w i t h o u t   e v e n   t h e   i m p l i e d   w a r r a n t y   o f 
 M E R C H A N T A B I L I T Y   o r   F I T N E S S   F O R   A   P A R T I C U L A R   P U R P O S E .     S e e   t h e 
 G N U   G e n e r a l   P u b l i c   L i c e n s e   f o r   m o r e   d e t a i l s . 
 
 Y o u   s h o u l d   h a v e   r e c e i v e d   a   c o p y   o f   t h e   G N U   G e n e r a l   P u b l i c   L i c e n s e 
 a l o n g   w i t h   F o o b a r .     I f   n o t ,   s e e   < h t t p : / / w w w . g n u . o r g / l i c e n s e s / >     
  
 l     ��������  ��  ��        l          x     ��  ��    1      ��
�� 
ascr  �� ��
�� 
minv  m         �    2 . 3��      OS X 10.9 Yosemite     �   &   O S   X   1 0 . 9   Y o s e m i t e      x    �� ����    2  	 ��
�� 
osax��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��       !   j     &�� "�� *0 nsregularexpression NSRegularExpression " 4     %�� #
�� 
pcls # m   " # $ $ � % % & N S R e g u l a r E x p r e s s i o n !  & ' & j   ' -�� (�� 0 nsstring NSString ( 4   ' ,�� )
�� 
pcls ) m   ) * * * � + +  N S S t r i n g '  , - , j   . 0�� .
�� 
pnam . m   . / / / � 0 0  X R e g e x -  1 2 1 j   1 3�� 3�� 0 _regexp   3 m   1 2��
�� 
msng 2  4 5 4 l     ��������  ��  ��   5  6 7 6 l      �� 8 9��   8��!@references
Home page || http://www.script-factory.net/XModules/XRegex/en/index.html
ChangeLog || http://www.script-factory.net/XModules/XRegex/changelog.html
Repository || https://github.com/tkurita/XRegex.scptd
NSRegularExpression || https://developer.apple.com/documentation/foundation/nsregularexpression?language=objc
NSTextCheckingResult || https://developer.apple.com/documentation/foundation/nstextcheckingresult?language=objc
ICU || http://userguide.icu-project.org/strings/regexp
MatchResult || #MatchResult

@title XRegex Reference
* Version : 1.0
* Author : Kurita Tetsuro ((<scriptfactory@mac.com>))
* Requirements : OS X 10.9 or later
* ((<Home page>)) || ((<ChangeLog>)) || ((<Repository>)) 

XReguex is an AppleScript library to process text with regular rexpressions. 
It's a wrapper of ((<NSRegularExpression>)).

In simple cases, class methods of ((<search>)), ((<search_all>)) and ((<replace_matches>)).

((<search>)) methods returns a ((<MatchResult>)) object for first matched text.
When matched texts with the regular expressions can not be found, missig value is returned.

You can obtaine matched texts and range by using ((<capture>)) and ((<range>)) methods of ((<MatchResult>)) object.

When the regular expression is used repeatedly, compile the regular rexpression with ((<make_with>)) and store obtained XRegex instance. 
And use instance methods of ((<first_match>)), ((<matches_in>)), ((<replace>)).

For syntax of regular expression, see the pages of ((<NSRegularExpression>)) and ((<ICU>)).

== Examples
@example
use XRegex : script "XRegex"(*** Using Class methods ***)-- Obtain first matchetell XRegex's search("��d{4}", "1972-01-27")	if it is not missing value then		log capture(0) (*1972*)		log range(0) (*length:4, location:0*)	end ifend tell-- Obtain all mathestell XRegex's search_all("��d{2}", "1972-01-27")	repeat with a_match in it		tell a_match			log capture(0)			log range(0)			(*19*)			(*length:2, location:0*)			(*72*)			(*length:2, location:2*)			(*01*)			(*length:2, location:5*)			(*27*)			(*length:2, location:8*)		end tell	end repeatend tell-- Replacelog XRegex's replace_matches("��d{2}", "1972-01-27", "xx") (*xxxx-xx-xx*)(*** Compiling Regular Expression and Working with Instance Methods ***)-- Simple casestell XRegex's make_with("(��d{4})-��d{1,2}-��d{1,2}")	log count_in("2020-10-10") (*1*)		tell first_match("2020-10-10")		if it is not missing value then			log (count it) (*2*)			log its capture(0) -- 2020-10-10 : whole match			log its capture(1) -- 2020 : first capture		end if	end tellend tell-- Obtain matched all sub-textstell XRegex's make_with("��d{2}")	set matches to matches_in("2021-10-20")end telllog (count matches) (*4*)tell item 1 of matches	log (count it) (*1*)	log capture(0) (*20*)	log range(0) (*length:2, location:0*)end telltell item 2 of matches	log (count it) (*1*)	log capture(0) (*21*)	set {location:loc, length:len} to range(0) (*length:2, location:2*)	--obtain substring	log substring(loc + 3, len) (*10*)end tell-- Replacetell XRegex's make_with("http://([^/]+)(/[^/]+)*")	log replace("http://www.script-factory.net/index.html", ��		"https://$1")	(*https://www.script-factory.net*)end tell    9 � : :d ! @ r e f e r e n c e s 
 H o m e   p a g e   | |   h t t p : / / w w w . s c r i p t - f a c t o r y . n e t / X M o d u l e s / X R e g e x / e n / i n d e x . h t m l 
 C h a n g e L o g   | |   h t t p : / / w w w . s c r i p t - f a c t o r y . n e t / X M o d u l e s / X R e g e x / c h a n g e l o g . h t m l 
 R e p o s i t o r y   | |   h t t p s : / / g i t h u b . c o m / t k u r i t a / X R e g e x . s c p t d 
 N S R e g u l a r E x p r e s s i o n   | |   h t t p s : / / d e v e l o p e r . a p p l e . c o m / d o c u m e n t a t i o n / f o u n d a t i o n / n s r e g u l a r e x p r e s s i o n ? l a n g u a g e = o b j c 
 N S T e x t C h e c k i n g R e s u l t   | |   h t t p s : / / d e v e l o p e r . a p p l e . c o m / d o c u m e n t a t i o n / f o u n d a t i o n / n s t e x t c h e c k i n g r e s u l t ? l a n g u a g e = o b j c 
 I C U   | |   h t t p : / / u s e r g u i d e . i c u - p r o j e c t . o r g / s t r i n g s / r e g e x p 
 M a t c h R e s u l t   | |   # M a t c h R e s u l t 
 
 @ t i t l e   X R e g e x   R e f e r e n c e 
 *   V e r s i o n   :   1 . 0 
 *   A u t h o r   :   K u r i t a   T e t s u r o   ( ( < s c r i p t f a c t o r y @ m a c . c o m > ) ) 
 *   R e q u i r e m e n t s   :   O S   X   1 0 . 9   o r   l a t e r 
 *   ( ( < H o m e   p a g e > ) )   | |   ( ( < C h a n g e L o g > ) )   | |   ( ( < R e p o s i t o r y > ) )   
 
 X R e g u e x   i s   a n   A p p l e S c r i p t   l i b r a r y   t o   p r o c e s s   t e x t   w i t h   r e g u l a r   r e x p r e s s i o n s .   
 I t ' s   a   w r a p p e r   o f   ( ( < N S R e g u l a r E x p r e s s i o n > ) ) . 
 
 I n   s i m p l e   c a s e s ,   c l a s s   m e t h o d s   o f   ( ( < s e a r c h > ) ) ,   ( ( < s e a r c h _ a l l > ) )   a n d   ( ( < r e p l a c e _ m a t c h e s > ) ) . 
 
 ( ( < s e a r c h > ) )   m e t h o d s   r e t u r n s   a   ( ( < M a t c h R e s u l t > ) )   o b j e c t   f o r   f i r s t   m a t c h e d   t e x t . 
 W h e n   m a t c h e d   t e x t s   w i t h   t h e   r e g u l a r   e x p r e s s i o n s   c a n   n o t   b e   f o u n d ,   m i s s i g   v a l u e   i s   r e t u r n e d . 
 
 Y o u   c a n   o b t a i n e   m a t c h e d   t e x t s   a n d   r a n g e   b y   u s i n g   ( ( < c a p t u r e > ) )   a n d   ( ( < r a n g e > ) )   m e t h o d s   o f   ( ( < M a t c h R e s u l t > ) )   o b j e c t . 
 
 W h e n   t h e   r e g u l a r   e x p r e s s i o n   i s   u s e d   r e p e a t e d l y ,   c o m p i l e   t h e   r e g u l a r   r e x p r e s s i o n   w i t h   ( ( < m a k e _ w i t h > ) )   a n d   s t o r e   o b t a i n e d   X R e g e x   i n s t a n c e .   
 A n d   u s e   i n s t a n c e   m e t h o d s   o f   ( ( < f i r s t _ m a t c h > ) ) ,   ( ( < m a t c h e s _ i n > ) ) ,   ( ( < r e p l a c e > ) ) . 
 
 F o r   s y n t a x   o f   r e g u l a r   e x p r e s s i o n ,   s e e   t h e   p a g e s   o f   ( ( < N S R e g u l a r E x p r e s s i o n > ) )   a n d   ( ( < I C U > ) ) . 
 
 = =   E x a m p l e s 
 @ e x a m p l e 
 u s e   X R e g e x   :   s c r i p t   " X R e g e x "   ( * * *   U s i n g   C l a s s   m e t h o d s   * * * )  - -   O b t a i n   f i r s t   m a t c h e  t e l l   X R e g e x ' s   s e a r c h ( " \ \ d { 4 } " ,   " 1 9 7 2 - 0 1 - 2 7 " )  	 i f   i t   i s   n o t   m i s s i n g   v a l u e   t h e n  	 	 l o g   c a p t u r e ( 0 )   ( * 1 9 7 2 * )  	 	 l o g   r a n g e ( 0 )   ( * l e n g t h : 4 ,   l o c a t i o n : 0 * )  	 e n d   i f  e n d   t e l l   - -   O b t a i n   a l l   m a t h e s  t e l l   X R e g e x ' s   s e a r c h _ a l l ( " \ \ d { 2 } " ,   " 1 9 7 2 - 0 1 - 2 7 " )  	 r e p e a t   w i t h   a _ m a t c h   i n   i t  	 	 t e l l   a _ m a t c h  	 	 	 l o g   c a p t u r e ( 0 )  	 	 	 l o g   r a n g e ( 0 )  	 	 	 ( * 1 9 * )  	 	 	 ( * l e n g t h : 2 ,   l o c a t i o n : 0 * )  	 	 	 ( * 7 2 * )  	 	 	 ( * l e n g t h : 2 ,   l o c a t i o n : 2 * )  	 	 	 ( * 0 1 * )  	 	 	 ( * l e n g t h : 2 ,   l o c a t i o n : 5 * )  	 	 	 ( * 2 7 * )  	 	 	 ( * l e n g t h : 2 ,   l o c a t i o n : 8 * )  	 	 e n d   t e l l  	 e n d   r e p e a t  e n d   t e l l   - -   R e p l a c e  l o g   X R e g e x ' s   r e p l a c e _ m a t c h e s ( " \ \ d { 2 } " ,   " 1 9 7 2 - 0 1 - 2 7 " ,   " x x " )   ( * x x x x - x x - x x * )   ( * * *   C o m p i l i n g   R e g u l a r   E x p r e s s i o n   a n d   W o r k i n g   w i t h   I n s t a n c e   M e t h o d s   * * * )  - -   S i m p l e   c a s e s  t e l l   X R e g e x ' s   m a k e _ w i t h ( " ( \ \ d { 4 } ) - \ \ d { 1 , 2 } - \ \ d { 1 , 2 } " )  	 l o g   c o u n t _ i n ( " 2 0 2 0 - 1 0 - 1 0 " )   ( * 1 * )  	  	 t e l l   f i r s t _ m a t c h ( " 2 0 2 0 - 1 0 - 1 0 " )  	 	 i f   i t   i s   n o t   m i s s i n g   v a l u e   t h e n  	 	 	 l o g   ( c o u n t   i t )   ( * 2 * )  	 	 	 l o g   i t s   c a p t u r e ( 0 )   - -   2 0 2 0 - 1 0 - 1 0   :   w h o l e   m a t c h  	 	 	 l o g   i t s   c a p t u r e ( 1 )   - -   2 0 2 0   :   f i r s t   c a p t u r e  	 	 e n d   i f  	 e n d   t e l l  e n d   t e l l   - -   O b t a i n   m a t c h e d   a l l   s u b - t e x t s  t e l l   X R e g e x ' s   m a k e _ w i t h ( " \ \ d { 2 } " )  	 s e t   m a t c h e s   t o   m a t c h e s _ i n ( " 2 0 2 1 - 1 0 - 2 0 " )  e n d   t e l l  l o g   ( c o u n t   m a t c h e s )   ( * 4 * )  t e l l   i t e m   1   o f   m a t c h e s  	 l o g   ( c o u n t   i t )   ( * 1 * )  	 l o g   c a p t u r e ( 0 )   ( * 2 0 * )  	 l o g   r a n g e ( 0 )   ( * l e n g t h : 2 ,   l o c a t i o n : 0 * )  e n d   t e l l   t e l l   i t e m   2   o f   m a t c h e s  	 l o g   ( c o u n t   i t )   ( * 1 * )  	 l o g   c a p t u r e ( 0 )   ( * 2 1 * )  	 s e t   { l o c a t i o n : l o c ,   l e n g t h : l e n }   t o   r a n g e ( 0 )   ( * l e n g t h : 2 ,   l o c a t i o n : 2 * )  	 - - o b t a i n   s u b s t r i n g  	 l o g   s u b s t r i n g ( l o c   +   3 ,   l e n )   ( * 1 0 * )  e n d   t e l l    - -   R e p l a c e  t e l l   X R e g e x ' s   m a k e _ w i t h ( " h t t p : / / ( [ ^ / ] + ) ( / [ ^ / ] + ) * " )  	 l o g   r e p l a c e ( " h t t p : / / w w w . s c r i p t - f a c t o r y . n e t / i n d e x . h t m l " ,   �  	 	 " h t t p s : / / $ 1 " )  	 ( * h t t p s : / / w w w . s c r i p t - f a c t o r y . n e t * )  e n d   t e l l  7  ; < ; l     ��������  ��  ��   <  = > = l      �� ? @��   ?  !@group Class Methods     @ � A A , ! @ g r o u p   C l a s s   M e t h o d s   >  B C B l     ��������  ��  ��   C  D E D l      �� F G��   F � �!@abstruct
Returns the first match of the regular expression in the text.@param pattern (text) : Regular expression pattern.
@param a_text (text or XText) : The text to search.@result script : ((<MatchResult>))    G � H H� ! @ a b s t r u c t 
 R e t u r n s   t h e   f i r s t   m a t c h   o f   t h e   r e g u l a r   e x p r e s s i o n   i n   t h e   t e x t .  @ p a r a m   p a t t e r n   ( t e x t )   :   R e g u l a r   e x p r e s s i o n   p a t t e r n . 
 @ p a r a m   a _ t e x t   ( t e x t   o r   X T e x t )   :   T h e   t e x t   t o   s e a r c h .  @ r e s u l t   s c r i p t   :   ( ( < M a t c h R e s u l t > ) )  E  I J I i   4 7 K L K I      �� M���� 
0 search   M  N O N o      ���� 0 pattern   O  P�� P o      ���� 
0 a_text  ��  ��   L L      Q Q n     R S R I    �� T���� 0 first_match   T  U�� U o    ���� 
0 a_text  ��  ��   S I     �� V���� 0 	make_with   V  W�� W o    ���� 0 pattern  ��  ��   J  X Y X l     ��������  ��  ��   Y  Z [ Z l      �� \ ]��   \ � �!@abstruct
Returns a list containing all the matches of the regular expression in the text.@param pattern (text) : Regular expression pattern.
@param a_text (text or XText) : The text to search.@result list : list of ((<MatchResult>))    ] � ^ ^� ! @ a b s t r u c t 
 R e t u r n s   a   l i s t   c o n t a i n i n g   a l l   t h e   m a t c h e s   o f   t h e   r e g u l a r   e x p r e s s i o n   i n   t h e   t e x t .  @ p a r a m   p a t t e r n   ( t e x t )   :   R e g u l a r   e x p r e s s i o n   p a t t e r n . 
 @ p a r a m   a _ t e x t   ( t e x t   o r   X T e x t )   :   T h e   t e x t   t o   s e a r c h .  @ r e s u l t   l i s t   :   l i s t   o f   ( ( < M a t c h R e s u l t > ) )  [  _ ` _ i   8 ; a b a I      �� c���� 0 
search_all   c  d e d o      ���� 0 pattern   e  f�� f o      ���� 
0 a_text  ��  ��   b L      g g n     h i h I    �� j���� 0 
matches_in   j  k�� k o    ���� 
0 a_text  ��  ��   i I     �� l���� 0 	make_with   l  m�� m o    ���� 0 pattern  ��  ��   `  n o n l     ��������  ��  ��   o  p q p l      �� r s��   r � �!@abstruct
Returns the number of matches of the regular expression in the text.@param pattern (text) : Regular expression pattern.
@param a_text (text or XText) : The text to search.@result integer    s � t t� ! @ a b s t r u c t 
 R e t u r n s   t h e   n u m b e r   o f   m a t c h e s   o f   t h e   r e g u l a r   e x p r e s s i o n   i n   t h e   t e x t .  @ p a r a m   p a t t e r n   ( t e x t )   :   R e g u l a r   e x p r e s s i o n   p a t t e r n . 
 @ p a r a m   a _ t e x t   ( t e x t   o r   X T e x t )   :   T h e   t e x t   t o   s e a r c h .  @ r e s u l t   i n t e g e r  q  u v u i   < ? w x w I      �� y���� 0 count_matches   y  z { z o      ���� 0 pattern   {  |�� | o      ���� 
0 a_text  ��  ��   x L      } } n     ~  ~ I    �� ����� 0 count_in   �  ��� � o    ���� 
0 a_text  ��  ��    I     �� ����� 0 	make_with   �  ��� � o    ���� 0 pattern  ��  ��   v  � � � l     ��������  ��  ��   �  � � � l      �� � ���   �C=!@abstruct
Returns a new text containing matching regular expressions replaced with the template text.@param pattern (text) : Regular expression pattern.
@param a_text (text or XText) : The text to search.
@param a_template (text or XText) : The substitution template used when replacing matched texts.@result text    � � � �z ! @ a b s t r u c t 
 R e t u r n s   a   n e w   t e x t   c o n t a i n i n g   m a t c h i n g   r e g u l a r   e x p r e s s i o n s   r e p l a c e d   w i t h   t h e   t e m p l a t e   t e x t .  @ p a r a m   p a t t e r n   ( t e x t )   :   R e g u l a r   e x p r e s s i o n   p a t t e r n . 
 @ p a r a m   a _ t e x t   ( t e x t   o r   X T e x t )   :   T h e   t e x t   t o   s e a r c h . 
 @ p a r a m   a _ t e m p l a t e   ( t e x t   o r   X T e x t )   :   T h e   s u b s t i t u t i o n   t e m p l a t e   u s e d   w h e n   r e p l a c i n g   m a t c h e d   t e x t s .  @ r e s u l t   t e x t  �  � � � i   @ C � � � I      �� ����� 0 replace_matches   �  � � � o      ���� 0 pattern   �  � � � o      ���� 
0 a_text   �  ��� � o      ���� 0 
a_template  ��  ��   � L      � � n     � � � I    �� ����� 0 replace   �  � � � o    ���� 
0 a_text   �  ��� � o    ���� 0 
a_template  ��  ��   � I     �� ����� 0 	make_with   �  ��� � o    ���� 0 pattern  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l      �� � ���   � ! !@group Constructor Methods    � � � � 6 ! @ g r o u p   C o n s t r u c t o r   M e t h o d s �  � � � l     ��������  ��  ��   �  � � � l      �� � ���   � � �!@abstruct
Compile a regular expression and return a new XRegex instance.@param pattern (text) : regular expression@result script : new XRegex instance    � � � �4 ! @ a b s t r u c t 
 C o m p i l e   a   r e g u l a r   e x p r e s s i o n   a n d   r e t u r n   a   n e w   X R e g e x   i n s t a n c e .  @ p a r a m   p a t t e r n   ( t e x t )   :   r e g u l a r   e x p r e s s i o n  @ r e s u l t   s c r i p t   :   n e w   X R e g e x   i n s t a n c e  �  � � � i   D G � � � I      �� ����� 0 	make_with   �  ��� � o      ���� 0 pattern  ��  ��   � k     + � �  � � � r      � � � n     � � � I    �� ����� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_ �  � � � o    ���� 0 pattern   �  � � � m    ����   �  ��� � l    ����� � m    ��
�� 
msng��  ��  ��  ��   � o     ���� *0 nsregularexpression NSRegularExpression � o      ���� 0 a_regex   �  � � � Z     � ����� � =    � � � o    ���� 0 a_regex   � m    ��
�� 
msng � R    �� � �
�� .ascrerr ****      � **** � m     � � � � � R F a i l e d   t o   c o m p i l e   t h e   r e g u l a r   e x p r e s s i o n . � �� ��
�� 
errn � m    �~�~��  ��  ��   �  � � � r     # � � �  f     ! � o      �}�} 0 a_class   �  ��| � h   $ +�{ ��{  0 xregexinstance XRegexInstance � k       � �  � � � j     �z �
�z 
pare � o     �y�y 0 a_class   �  ��x � j   	 �w ��w 0 _regexp   � o   	 �v�v 0 a_regex  �x  �|   �  � � � l     �u�t�s�u  �t  �s   �  � � � i   H K � � � I      �r ��q�r 0 bare   �  ��p � o      �o�o 
0 a_text  �p  �q   � k      � �  � � � Z      � ��n�m � =     � � � n      � � � m    �l
�l 
pcls � o     �k�k 
0 a_text   � m    �j
�j 
scpt � L     � � n    � � � I   	 �i�h�g�i 0 as_text  �h  �g   � o    	�f�f 
0 a_text  �n  �m   �  ��e � L     � � o    �d�d 
0 a_text  �e   �  � � � l     �c�b�a�c  �b  �a   �  � � � l      �` � ��`   �  !@group Instance Methods     � � � � 2 ! @ g r o u p   I n s t a n c e   M e t h o d s   �  � � � l     �_�^�]�_  �^  �]   �  � � � l      �\ � ��\   � � �!@abstruct
Returns the first match of the regular expression in the text.
@param a_text (text or XText) : The text to search.@result script : ((<MatchResult>))    � � � �D ! @ a b s t r u c t 
 R e t u r n s   t h e   f i r s t   m a t c h   o f   t h e   r e g u l a r   e x p r e s s i o n   i n   t h e   t e x t .  
 @ p a r a m   a _ t e x t   ( t e x t   o r   X T e x t )   :   T h e   t e x t   t o   s e a r c h .  @ r e s u l t   s c r i p t   :   ( ( < M a t c h R e s u l t > ) )  �  � � � i   L O � � � I      �[ ��Z�[ 0 first_match   �  �Y  o      �X�X 
0 a_text  �Y  �Z   � k     >  r      n     I    �W�V�W &0 stringwithstring_ stringWithString_ 	�U	 I    �T
�S�T 0 bare  
 �R o    �Q�Q 
0 a_text  �R  �S  �U  �V   o     �P�P 0 nsstring NSString o      �O�O 
0 a_text    O    ( r    ' n   % I    %�N�M�N F0 !firstmatchinstring_options_range_ !firstMatchInString_options_range_  o    �L�L 
0 a_text    m    �K�K   �J J    !  m    �I�I   �H n    o    �G�G 
0 length   o    �F�F 
0 a_text  �H  �J  �M    g     o      �E�E 0 a_result   n    !  o    �D�D 0 _regexp  !  f     "#" Z   ) 5$%�C�B$ =  ) ,&'& o   ) *�A�A 0 a_result  ' m   * +�@
�@ 
msng% L   / 1(( m   / 0�?
�? 
msng�C  �B  # )�>) L   6 >** I   6 =�=+�<�= 0 make_match_result  + ,-, o   7 8�;�; 0 a_result  - .�:. o   8 9�9�9 
0 a_text  �:  �<  �>   � /0/ l     �8�7�6�8  �7  �6  0 121 l      �534�5  3 � �!@abstruct
Returns a list containing all the matches of the regular expression in the text.
@param a_text (text or XText) : The text to search.@result list : list of ((<MatchResult>))   4 �55r ! @ a b s t r u c t 
 R e t u r n s   a   l i s t   c o n t a i n i n g   a l l   t h e   m a t c h e s   o f   t h e   r e g u l a r   e x p r e s s i o n   i n   t h e   t e x t . 
 @ p a r a m   a _ t e x t   ( t e x t   o r   X T e x t )   :   T h e   t e x t   t o   s e a r c h .  @ r e s u l t   l i s t   :   l i s t   o f   ( ( < M a t c h R e s u l t > ) ) 2 676 i   P S898 I      �4:�3�4 0 
matches_in  : ;�2; o      �1�1 
0 a_text  �2  �3  9 k     P<< =>= l     �0?@�0  ?  log "start matches_in"   @ �AA , l o g   " s t a r t   m a t c h e s _ i n "> BCB l    DEFD r     GHG n    IJI I    �/K�.�/ &0 stringwithstring_ stringWithString_K L�-L I    �,M�+�, 0 bare  M N�*N o    �)�) 
0 a_text  �*  �+  �-  �.  J o     �(�( 0 nsstring NSStringH o      �'�' 
0 a_text  E , & to share between multiple MatchResult   F �OO L   t o   s h a r e   b e t w e e n   m u l t i p l e   M a t c h R e s u l tC PQP r    #RSR n   !TUT l   !V�&�%V n   !WXW I    !�$Y�#�$ @0 matchesinstring_options_range_ matchesInString_options_range_Y Z[Z o    �"�" 
0 a_text  [ \]\ m    �!�!  ] ^� ^ J    __ `a` m    ��  a b�b n   cdc o    �� 
0 length  d o    �� 
0 a_text  �  �   �#  X o    �� 0 _regexp  �&  �%  U  f    S o      �� 0 a_result  Q efe r   $ (ghg J   $ &��  h o      �� 0 result_list  f iji Y   ) Mk�lm�k r   9 Hnon I   9 E�p�� 0 make_match_result  p qrq n  : @sts I   ; @�u��  0 objectatindex_ objectAtIndex_u v�v o   ; <�� 0 n  �  �  t o   : ;�� 0 a_result  r w�w o   @ A�� 
0 a_text  �  �  o n      xyx  ;   F Gy o   E F�� 0 result_list  � 0 n  l m   , -��  m \   - 4z{z l  - 2|�
�	| n  - 2}~} I   . 2���� 	0 count  �  �  ~ o   - .�� 0 a_result  �
  �	  { m   2 3�� �  j � l  N N����  �  log "end of matches_in"   � ��� . l o g   " e n d   o f   m a t c h e s _ i n "� ��� L   N P�� o   N O�� 0 result_list  �  7 ��� l     � �����   ��  ��  � ��� l      ������  � � �!@abstruct
Returns the number of matches of the regular expression in the text.
@param a_text (text or XText) : The text to search.@result integer   � ���* ! @ a b s t r u c t 
 R e t u r n s   t h e   n u m b e r   o f   m a t c h e s   o f   t h e   r e g u l a r   e x p r e s s i o n   i n   t h e   t e x t .  
 @ p a r a m   a _ t e x t   ( t e x t   o r   X T e x t )   :   T h e   t e x t   t o   s e a r c h .  @ r e s u l t   i n t e g e r � ��� i   T W��� I      ������� 0 count_in  � ���� o      ���� 
0 a_text  ��  ��  � k     �� ��� r     ��� I     ������� 0 bare  � ���� o    ���� 
0 a_text  ��  ��  � o      ���� 
0 a_text  � ��� r   	 ��� n  	 ��� I    ������� P0 &numberofmatchesinstring_options_range_ &numberOfMatchesInString_options_range_� ��� o    ���� 
0 a_text  � ��� m    ����  � ���� J    �� ��� m    ����  � ���� n   ��� 1    ��
�� 
leng� o    ���� 
0 a_text  ��  ��  ��  � l  	 ������ n  	 ��� o   
 ���� 0 _regexp  �  f   	 
��  ��  � o      ���� 0 a_result  � ���� L    �� o    ���� 0 a_result  ��  � ��� l     ��������  ��  ��  � ��� l      ������  �
!@abstruct
Returns a new text containing matching regular expressions replaced with the template text.
@param a_text (text or XText) : The text to search.
@param a_template (text or XText) : The substitution template used when replacing matched texts.@result text   � ��� ! @ a b s t r u c t 
 R e t u r n s   a   n e w   t e x t   c o n t a i n i n g   m a t c h i n g   r e g u l a r   e x p r e s s i o n s   r e p l a c e d   w i t h   t h e   t e m p l a t e   t e x t .  
 @ p a r a m   a _ t e x t   ( t e x t   o r   X T e x t )   :   T h e   t e x t   t o   s e a r c h . 
 @ p a r a m   a _ t e m p l a t e   ( t e x t   o r   X T e x t )   :   T h e   s u b s t i t u t i o n   t e m p l a t e   u s e d   w h e n   r e p l a c i n g   m a t c h e d   t e x t s .  @ r e s u l t   t e x t � ��� i   X [��� I      ������� 0 replace  � ��� o      ���� 
0 a_text  � ���� o      ���� 0 
a_template  ��  ��  � k     .�� ��� r     ��� I     ������� 0 bare  � ���� o    ���� 
0 a_text  ��  ��  � o      ���� 
0 a_text  � ��� r   	 ��� I   	 ������� 0 bare  � ���� o   
 ���� 0 
a_template  ��  ��  � o      ���� 0 
a_template  � ��� O    )��� r    (��� n   &��� I    &������� |0 <stringbyreplacingmatchesinstring_options_range_withtemplate_ <stringByReplacingMatchesInString_options_range_withTemplate_� ��� o    ���� 
0 a_text  � ��� m    ����  � ��� J    !�� ��� m    ����  � ���� n   ��� 1    ��
�� 
leng� o    ���� 
0 a_text  ��  � ���� o   ! "���� 0 
a_template  ��  ��  �  g    � o      ���� 0 a_result  � n   ��� o    ���� 0 _regexp  �  f    � ���� L   * .�� c   * -��� o   * +���� 0 a_result  � m   + ,��
�� 
ctxt��  � ��� l     ��������  ��  ��  � ��� l      ������  �!@group MatchResult 
MatchResult is a wapper of ((<NSTextCheckingResult>)) which expresses pattern maching results. 
Each MatchResult object contains infomation about matched texts with the pattern and caputred groups. 
These infomation can be obtained by using ((<capture>)) and ((<range>)) methods.

MatchResult objects are returned by ((<search>)), ((<search_all>)), ((<first_match>)) and ((<matches_in>)).

The location value of ((<range>)) is zero based i.e. follows the manner of NSString not the manner of AppleScript's text.
To obtain substring of the range calculated from returned value of ((<range>)) in the searched text, use ((<substring>)) or ((<substring_from>)), 
because NSString's character counts and indexes may not be able to exchanged for AppleScript's text.
   � ��� ! @ g r o u p   M a t c h R e s u l t   
 M a t c h R e s u l t   i s   a   w a p p e r   o f   ( ( < N S T e x t C h e c k i n g R e s u l t > ) )   w h i c h   e x p r e s s e s   p a t t e r n   m a c h i n g   r e s u l t s .   
 E a c h   M a t c h R e s u l t   o b j e c t   c o n t a i n s   i n f o m a t i o n   a b o u t   m a t c h e d   t e x t s   w i t h   t h e   p a t t e r n   a n d   c a p u t r e d   g r o u p s .   
 T h e s e   i n f o m a t i o n   c a n   b e   o b t a i n e d   b y   u s i n g   ( ( < c a p t u r e > ) )   a n d   ( ( < r a n g e > ) )   m e t h o d s . 
 
 M a t c h R e s u l t   o b j e c t s   a r e   r e t u r n e d   b y   ( ( < s e a r c h > ) ) ,   ( ( < s e a r c h _ a l l > ) ) ,   ( ( < f i r s t _ m a t c h > ) )   a n d   ( ( < m a t c h e s _ i n > ) ) . 
 
 T h e   l o c a t i o n   v a l u e   o f   ( ( < r a n g e > ) )   i s   z e r o   b a s e d   i . e .   f o l l o w s   t h e   m a n n e r   o f   N S S t r i n g   n o t   t h e   m a n n e r   o f   A p p l e S c r i p t ' s   t e x t . 
 T o   o b t a i n   s u b s t r i n g   o f   t h e   r a n g e   c a l c u l a t e d   f r o m   r e t u r n e d   v a l u e   o f   ( ( < r a n g e > ) )   i n   t h e   s e a r c h e d   t e x t ,   u s e   ( ( < s u b s t r i n g > ) )   o r   ( ( < s u b s t r i n g _ f r o m > ) ) ,   
 b e c a u s e   N S S t r i n g ' s   c h a r a c t e r   c o u n t s   a n d   i n d e x e s   m a y   n o t   b e   a b l e   t o   e x c h a n g e d   f o r   A p p l e S c r i p t ' s   t e x t . 
� ��� l     ��������  ��  ��  � ��� i   \ _��� I      ������� 	0 split  � ���� o      ���� 
0 a_text  ��  ��  � k     ��� ��� l     ������  �  log "start split"   � ��� " l o g   " s t a r t   s p l i t "� ��� l       r      n     I    ������ &0 stringwithstring_ stringWithString_ �� I    ��	���� 0 bare  	 
��
 o    ���� 
0 a_text  ��  ��  ��  ��   o     ���� 0 nsstring NSString o      ���� 
0 a_text   , & to share between multiple MatchResult    � L   t o   s h a r e   b e t w e e n   m u l t i p l e   M a t c h R e s u l t�  r    # n   ! l   !���� n   ! I    !������ @0 matchesinstring_options_range_ matchesInString_options_range_  o    ���� 
0 a_text    m    ����   �� J      m    ����   �� n     o    ���� 
0 length    o    ���� 
0 a_text  ��  ��  ��   o    ���� 0 _regexp  ��  ��    f     o      ���� 0 a_result   !"! r   $ (#$# J   $ &����  $ o      ���� 0 result_list  " %&% r   ) ,'(' m   ) *����  ( o      ���� 0 sidx  & )*) r   - 4+,+ n  - 2-.- I   . 2�������� 	0 count  ��  ��  . o   - .���� 0 a_result  , o      ���� 0 nmatches  * /0/ I  5 :��1��
�� .ascrcmnt****      � ****1 o   5 6���� 0 nmatches  ��  0 232 Z   ; K45����4 =  ; >676 o   ; <���� 0 nmatches  7 m   < =����  5 L   A G88 J   A F99 :��: c   A D;<; o   A B���� 
0 a_text  < m   B C��
�� 
ctxt��  ��  ��  3 =>= Y   L �?��@A��? k   X �BB CDC I  X ]��E��
�� .ascrcmnt****      � ****E o   X Y���� 0 n  ��  D FGF r   ^ fHIH l  ^ dJ����J n  ^ dKLK I   _ d��M����  0 objectatindex_ objectAtIndex_M N��N o   _ `���� 0 n  ��  ��  L o   ^ _���� 0 a_result  ��  ��  I o      ���� 0 	chkresult  G O��O Y   g �P�QR�~P k   w �SS TUT I  w |�}V�|
�} .ascrcmnt****      � ****V o   w x�{�{ 0 m  �|  U WXW r   } �YZY l  } �[�z�y[ n  } �\]\ I   ~ ��x^�w�x 0 rangeatindex_ rangeAtIndex_^ _�v_ o   ~ �u�u 0 m  �v  �w  ] o   } ~�t�t 0 	chkresult  �z  �y  Z K      `` �sab�s 0 location  a o      �r�r 0 loc  b �qc�p�q 
0 length  c o      �o�o 0 len  �p  X ded Z   � �fg�nhf >  � �iji o   � ��m�m 0 sidx  j o   � ��l�l 0 loc  g k   � �kk lml r   � �non l  � �p�k�jp n  � �qrq I   � ��is�h�i *0 substringwithrange_ substringWithRange_s t�gt K   � �uu �fvw�f 0 location  v o   � ��e�e 0 sidx  w �dx�c�d 
0 length  x \   � �yzy o   � ��b�b 0 loc  z o   � ��a�a 0 sidx  �c  �g  �h  r o   � ��`�` 
0 a_text  �k  �j  o o      �_�_ 0 subtext  m {�^{ r   � �|}| l  � �~�]�\~ c   � �� o   � ��[�[ 0 subtext  � m   � ��Z
�Z 
ctxt�]  �\  } n      ���  ;   � �� o   � ��Y�Y 0 result_list  �^  �n  h r   � ���� m   � ��� ���  � n      ���  ;   � �� o   � ��X�X 0 result_list  e ��W� r   � ���� [   � ���� o   � ��V�V 0 loc  � o   � ��U�U 0 len  � o      �T�T 0 sidx  �W  � 0 m  Q m   j k�S�S  R \   k r��� l  k p��R�Q� n  k p��� I   l p�P�O�N�P  0 numberofranges numberOfRanges�O  �N  � o   k l�M�M 0 	chkresult  �R  �Q  � m   p q�L�L �~  ��  �� 0 n  @ m   O P�K�K  A \   P S��� l  P Q��J�I� o   P Q�H�H 0 nmatches  �J  �I  � m   Q R�G�G ��  > ��� r   � ���� n  � ���� I   � ��F�E�D�F 
0 length  �E  �D  � o   � ��C�C 
0 a_text  � o      �B�B 0 	total_len  � ��� Z   � ����A�@� ?   � ���� o   � ��?�? 0 	total_len  � o   � ��>�> 0 sidx  � k   � ��� ��� r   � ���� l  � ���=�<� n  � ���� I   � ��;��:�; *0 substringwithrange_ substringWithRange_� ��9� K   � ��� �8���8 0 location  � o   � ��7�7 0 sidx  � �6��5�6 
0 length  � \   � ���� o   � ��4�4 0 	total_len  � o   � ��3�3 0 sidx  �5  �9  �:  � o   � ��2�2 
0 a_text  �=  �<  � o      �1�1 0 subtext  � ��0� r   � ���� l  � ���/�.� c   � ���� o   � ��-�- 0 subtext  � m   � ��,
�, 
ctxt�/  �.  � n      ���  ;   � �� o   � ��+�+ 0 result_list  �0  �A  �@  � ��� l  � ��*���*  �  log "end of matches_in"   � ��� . l o g   " e n d   o f   m a t c h e s _ i n "� ��)� L   � ��� o   � ��(�( 0 result_list  �)  � ��� l     �'�&�%�'  �&  �%  � ��� h   ` m�$��$ 0 matchresult MatchResult� k      �� ��� l      �#���#  � � �!@abstruct
	Returns a number of matched ranges.
	@description
	A result must have at least one. 
	When the regular expression have groups, the number of groups is included.	@result integer	   � ���~ ! @ a b s t r u c t 
 	 R e t u r n s   a   n u m b e r   o f   m a t c h e d   r a n g e s . 
 	 @ d e s c r i p t i o n 
 	 A   r e s u l t   m u s t   h a v e   a t   l e a s t   o n e .   
 	 W h e n   t h e   r e g u l a r   e x p r e s s i o n   h a v e   g r o u p s ,   t h e   n u m b e r   o f   g r o u p s   i s   i n c l u d e d .  	 @ r e s u l t   i n t e g e r  	� ��� i     ��� I     �"�!� 
�" .corecnte****       ****�!  �   � n    ��� n   ��� I    ����  0 numberofranges numberOfRanges�  �  � o    �� 0 _result  �  f     � ��� l     ����  �  �  � ��� l      ����  �0*!@abstruct
	Returns a text matched with the regular expression and texts of capture groups.
	@description
	capture(0) returns whole text matched with the regular expression. <br/>
	capture(1), capture(2) ... return texts of capture groups of $1, $2, ...
	@param an_index (integer) 	@result text	   � ���T ! @ a b s t r u c t 
 	 R e t u r n s   a   t e x t   m a t c h e d   w i t h   t h e   r e g u l a r   e x p r e s s i o n   a n d   t e x t s   o f   c a p t u r e   g r o u p s . 
 	 @ d e s c r i p t i o n 
 	 c a p t u r e ( 0 )   r e t u r n s   w h o l e   t e x t   m a t c h e d   w i t h   t h e   r e g u l a r   e x p r e s s i o n .   < b r / > 
 	 c a p t u r e ( 1 ) ,   c a p t u r e ( 2 )   . . .   r e t u r n   t e x t s   o f   c a p t u r e   g r o u p s   o f   $ 1 ,   $ 2 ,   . . .  
 	 @ p a r a m   a n _ i n d e x   ( i n t e g e r )    	 @ r e s u l t   t e x t  	� ��� i    ��� I      ���� 0 capture  � ��� o      �� 0 an_index  �  �  � k     �� ��� r     
��� n    ��� I    ���� 0 rangeatindex_ rangeAtIndex_� ��� o    �� 0 an_index  �  �  � l    ���� n    ��� o    �� 0 _result  �  f     �  �  � o      �� 0 a_range  � ��� L    �� c    ��� l   ��
�	� n   ��� I    ���� *0 substringwithrange_ substringWithRange_� ��� o    �� 0 a_range  �  �  � l   ���� n   ��� o    �� 	0 _text  �  f    �  �  �
  �	  � m    �
� 
ctxt�  � ��� l     � �����   ��  ��  � ��� l      ������  � � ~!@abstruct
	Returns a whole text matched with the regular expression.
	@description
	Equivalent to capture(0).	@result text	   � ��� � ! @ a b s t r u c t 
 	 R e t u r n s   a   w h o l e   t e x t   m a t c h e d   w i t h   t h e   r e g u l a r   e x p r e s s i o n . 
 	 @ d e s c r i p t i o n 
 	 E q u i v a l e n t   t o   c a p t u r e ( 0 ) .  	 @ r e s u l t   t e x t  	�    i     I      �������� 0 as_text  ��  ��   L      I     ������ 0 capture   �� m    ����  ��  ��    l     ��������  ��  ��   	
	 i     I      �������� 0 all_captures  ��  ��   k     ,  r      J     ����   o      ���� 0 a_result    r     n    n    I    ��������  0 numberofranges numberOfRanges��  ��   o    ���� 0 _result    f     o      ���� 0 n_ranges    Y    )���� r    $  I    !��!���� 	0 group  ! "��" o    ���� 0 n  ��  ��    n      #$#  ;   " #$ o   ! "���� 0 a_result  �� 0 n   m    ����   l   %����% \    &'& o    ���� 0 n_ranges  ' m    ���� ��  ��  ��   (��( L   * ,)) o   * +���� 0 a_result  ��  
 *+* l     ��������  ��  ��  + ,-, i    ./. I      �������� 0 as_list  ��  ��  / L     00 I     �������� 0 all_captures  ��  ��  - 121 l     ��������  ��  ��  2 343 l      ��56��  5e_!@abstruct
	Returns the range mateched with the regular expression and groups.
	@description
	renge(0) returns whole range matched with the regular expression.<br/>
	range(1), range(2) ... return ranges of capture groups of $1, $2, ...
	@param an_index (integer) : an index of the range to obtain	@result record : {location:integer, length:integer}	   6 �77� ! @ a b s t r u c t 
 	 R e t u r n s   t h e   r a n g e   m a t e c h e d   w i t h   t h e   r e g u l a r   e x p r e s s i o n   a n d   g r o u p s . 
 	 @ d e s c r i p t i o n 
 	 r e n g e ( 0 )   r e t u r n s   w h o l e   r a n g e   m a t c h e d   w i t h   t h e   r e g u l a r   e x p r e s s i o n . < b r / > 
 	 r a n g e ( 1 ) ,   r a n g e ( 2 )   . . .   r e t u r n   r a n g e s   o f   c a p t u r e   g r o u p s   o f   $ 1 ,   $ 2 ,   . . . 
 	 @ p a r a m   a n _ i n d e x   ( i n t e g e r )   :   a n   i n d e x   o f   t h e   r a n g e   t o   o b t a i n  	 @ r e s u l t   r e c o r d   :   { l o c a t i o n : i n t e g e r ,   l e n g t h : i n t e g e r }  	4 898 i    :;: I      ��<���� 	0 range  < =��= o      ���� 0 an_index  ��  ��  ; l    >?@> k     AA BCB r     DED n    FGF I    ��H���� 0 rangeatindex_ rangeAtIndex_H I��I o    ���� 0 an_index  ��  ��  G l    J����J n    KLK o    ���� 0 _result  L  f     ��  ��  E K      MM ��NO�� 0 location  N o      ���� 0 loc  O ��P���� 
0 length  P o      ���� 0 len  ��  C Q��Q L    RR K    SS ��TU�� 0 location  T o    ���� 0 loc  U ��V��
�� 
lengV o    ���� 0 len  ��  ��  ? "  return with zero base index   @ �WW 8   r e t u r n   w i t h   z e r o   b a s e   i n d e x9 XYX l     ��������  ��  ��  Y Z[Z l      ��\]��  \ � �!@abstruct
	Returns the substring specified with location and langth in searched text 
	@param loc (integer) : location of the substring by zero based index.
	@param len (integer) : length of the substring 	@result text	   ] �^^� ! @ a b s t r u c t 
 	 R e t u r n s   t h e   s u b s t r i n g   s p e c i f i e d   w i t h   l o c a t i o n   a n d   l a n g t h   i n   s e a r c h e d   t e x t   
 	 @ p a r a m   l o c   ( i n t e g e r )   :   l o c a t i o n   o f   t h e   s u b s t r i n g   b y   z e r o   b a s e d   i n d e x . 
 	 @ p a r a m   l e n   ( i n t e g e r )   :   l e n g t h   o f   t h e   s u b s t r i n g    	 @ r e s u l t   t e x t  	[ _`_ i    aba I      ��c���� 0 	substring  c ded o      ���� 0 loc  e f��f o      ���� 0 len  ��  ��  b k     gg hih n    jkj I    ��l���� *0 substringwithrange_ substringWithRange_l m��m K    	nn ��op�� 0 location  o o    ���� 0 loc  p ��q���� 
0 length  q o    ���� 0 len  ��  ��  ��  k l    r����r n    sts o    ���� 	0 _text  t  f     ��  ��  i u��u L    vv c    wxw 1    ��
�� 
rsltx m    ��
�� 
ctxt��  ` yzy l     ��������  ��  ��  z {|{ l      ��}~��  } � �!@abstruct
	Returns the substring from specified location to the end in searched text.
	@param loc (integer) : location of the substring by zero based index.	@result text	   ~ �Z ! @ a b s t r u c t 
 	 R e t u r n s   t h e   s u b s t r i n g   f r o m   s p e c i f i e d   l o c a t i o n   t o   t h e   e n d   i n   s e a r c h e d   t e x t . 
 	 @ p a r a m   l o c   ( i n t e g e r )   :   l o c a t i o n   o f   t h e   s u b s t r i n g   b y   z e r o   b a s e d   i n d e x .  	 @ r e s u l t   t e x t  	| ��� i    ��� I      ������� 0 substring_from  � ���� o      ���� 0 loc  ��  ��  � k     �� ��� n    ��� I    ������� *0 substringfromindex_ substringFromIndex_� ���� o    ���� 0 loc  ��  ��  � l    ������ n    ��� o    ���� 	0 _text  �  f     ��  ��  � ���� L   	 �� c   	 ��� 1   	 
��
�� 
rslt� m   
 ��
�� 
ctxt��  � ��� l     ��������  ��  ��  � ���� i     #��� I      ������� 0 	make_with  � ��� o      ���� 0 check_result  � ���� o      ���� 0 
a_nsstring  ��  ��  � k     �� ��� r     ���  f     � o      ���� 0 a_class  � ���� h    ����� 00 chekcingresultinstance ChekcingResultInstance� k      �� ��� j     ���
�� 
pare� o     ���� 0 a_class  � ��� j   	 ����� 0 _result  � o   	 �� 0 check_result  � ��~� j    �}��} 	0 _text  � o    �|�| 0 
a_nsstring  �~  ��  ��  � ��� l     �{�z�y�{  �z  �y  � ��� l     �x���x  � : 4 to locate MatchResult the letter part of the source   � ��� h   t o   l o c a t e   M a t c h R e s u l t   t h e   l e t t e r   p a r t   o f   t h e   s o u r c e� ��� i   n q��� I      �w��v�w 0 make_match_result  � ��� o      �u�u 0 check_result  � ��t� o      �s�s 0 
a_nsstring  �t  �v  � L     �� n    ��� I    �r��q�r 0 	make_with  � ��� o    �p�p 0 check_result  � ��o� o    �n�n 0 
a_nsstring  �o  �q  � o     �m�m 0 matchresult MatchResult� ��� l     �l�k�j�l  �k  �j  � ��� i   r u��� I      �i�h�g�i 0 open_helpbook  �h  �g  � Q     ,���� O   ��� I   
 �f��e�f 0 do  � ��d� I   �c��b
�c .earsffdralis        afdr�  f    �b  �d  �e  � 4    �a�
�a 
scpt� m    �� ���  O p e n H e l p B o o k� R      �`��
�` .ascrerr ****      � ****� o      �_�_ 0 msg  � �^��]
�^ 
errn� o      �\�\ 	0 errno  �]  � k    ,�� ��� I   "�[�Z�Y
�[ .miscactvnull��� ��� null�Z  �Y  � ��X� I  # ,�W��V
�W .sysodisAaleR        TEXT� l  # (��U�T� b   # (��� b   # &��� o   # $�S�S 0 msg  � o   $ %�R
�R 
ret � o   & '�Q�Q 	0 errno  �U  �T  �V  �X  � ��� l     �P�O�N�P  �O  �N  � ��� i   v y��� I      �M�L�K�M 	0 debug  �L  �K  � O     ��� k   	 �� ��� l  	 	�J���J  �  tell make_with("")   � ��� $ t e l l   m a k e _ w i t h ( " " )� ��I� I   	 �H��G�H 	0 split  � ��F� m   
 �� ���  a b 	 & 	 c d�F  �G  �I  � I     �E��D�E 0 	make_with  � ��C� m    �� ���  	 * [ & | 	 ] 	 *�C  �D  � ��� l     �B�A�@�B  �A  �@  � ��� i   z }��� I     �?�>�=
�? .aevtoappnull  �   � ****�>  �=  � k     �� � � l     �<�<    return debug()    �  r e t u r n   d e b u g ( )  �; I     �:�9�8�: 0 open_helpbook  �9  �8  �;  � �7 l     �6�5�4�6  �5  �4  �7       �3	 /�2
�3   �1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� ���
�1 
pimr�0 *0 nsregularexpression NSRegularExpression�/ 0 nsstring NSString
�. 
pnam�- 0 _regexp  �, 
0 search  �+ 0 
search_all  �* 0 count_matches  �) 0 replace_matches  �( 0 	make_with  �' 0 bare  �& 0 first_match  �% 0 
matches_in  �$ 0 count_in  �# 0 replace  �" 	0 split  �! 0 matchresult MatchResult�  0 make_match_result  � 0 open_helpbook  � 	0 debug  
� .aevtoappnull  �   � **** ��    � �
� 
vers�   ��
� 
cobj    �
� 
osax�   � �
� 
cobj  !!   � 
� 
frmk�   "" ��#
� misccura
� 
pcls# �$$ & N S R e g u l a r E x p r e s s i o n	 %% ��&
� misccura
� 
pcls& �''  N S S t r i n g
�2 
msng
 � L��()�� 
0 search  � �*� *  �
�	�
 0 pattern  �	 
0 a_text  �  ( ��� 0 pattern  � 
0 a_text  ) ��� 0 	make_with  � 0 first_match  � *�k+  �k+  � b��+,�� 0 
search_all  � � -�  -  ������ 0 pattern  �� 
0 a_text  �  + ������ 0 pattern  �� 
0 a_text  , ������ 0 	make_with  �� 0 
matches_in  � *�k+  �k+  �� x����./���� 0 count_matches  �� ��0�� 0  ������ 0 pattern  �� 
0 a_text  ��  . ������ 0 pattern  �� 
0 a_text  / ������ 0 	make_with  �� 0 count_in  �� *�k+  �k+  �� �����12���� 0 replace_matches  �� ��3�� 3  �������� 0 pattern  �� 
0 a_text  �� 0 
a_template  ��  1 �������� 0 pattern  �� 
0 a_text  �� 0 
a_template  2 ������ 0 	make_with  �� 0 replace  �� *�k+  ��l+  �� �����45���� 0 	make_with  �� ��6�� 6  ���� 0 pattern  ��  4 ���������� 0 pattern  �� 0 a_regex  �� 0 a_class  ��  0 xregexinstance XRegexInstance5 �������� ��� �7
�� 
msng�� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_
�� 
errn�����  0 xregexinstance XRegexInstance7 ��8����9:��
�� .ascrinit****      � ****8 k     ;;  �<<  �����  ��  ��  9 ����
�� 
pare�� 0 _regexp  : ����
�� 
pare�� 0 _regexp  �� b  N  Ob  ��� ,b  �j�m+ E�O��  )��l�Y hO)E�O��K S� �� �����=>���� 0 bare  �� ��?�� ?  ���� 
0 a_text  ��  = ���� 
0 a_text  > ������
�� 
pcls
�� 
scpt�� 0 as_text  �� ��,�  �j+ Y hO� �� �����@A���� 0 first_match  �� ��B�� B  ���� 
0 a_text  ��  @ ������ 
0 a_text  �� 0 a_result  A ���������������� 0 bare  �� &0 stringwithstring_ stringWithString_�� 0 _regexp  �� 
0 length  �� F0 !firstmatchinstring_options_range_ !firstMatchInString_options_range_
�� 
msng�� 0 make_match_result  �� ?b  *�k+  k+ E�O)�, *�jj��,lvm+ E�UO��  �Y hO*��l+  ��9����CD���� 0 
matches_in  �� ��E�� E  ���� 
0 a_text  ��  C ���������� 
0 a_text  �� 0 a_result  �� 0 result_list  �� 0 n  D ������������������ 0 bare  �� &0 stringwithstring_ stringWithString_�� 0 _regexp  �� 
0 length  �� @0 matchesinstring_options_range_ matchesInString_options_range_�� 	0 count  ��  0 objectatindex_ objectAtIndex_�� 0 make_match_result  �� Qb  *�k+  k+ E�O)�,�jj��,lvm+ E�OjvE�O #j�j+ kkh *��k+ �l+ �6F[OY��O� �������FG���� 0 count_in  �� ��H�� H  ���� 
0 a_text  ��  F ������ 
0 a_text  �� 0 a_result  G ���������� 0 bare  �� 0 _regexp  
�� 
leng�� P0 &numberofmatchesinstring_options_range_ &numberOfMatchesInString_options_range_�� *�k+  E�O)�,�jj��,lvm+ E�O� �������IJ���� 0 replace  �� ��K�� K  ������ 
0 a_text  �� 0 
a_template  ��  I �������� 
0 a_text  �� 0 
a_template  �� 0 a_result  J �������������� 0 bare  �� 0 _regexp  
�� 
leng�� �� |0 <stringbyreplacingmatchesinstring_options_range_withtemplate_ <stringByReplacingMatchesInString_options_range_withTemplate_
�� 
ctxt�� /*�k+  E�O*�k+  E�O)�, *�jj��,lv��+ E�UO��& �������LM��� 	0 split  �� �~N�~ N  �}�} 
0 a_text  ��  L �|�{�z�y�x�w�v�u�t�s�r�q�| 
0 a_text  �{ 0 a_result  �z 0 result_list  �y 0 sidx  �x 0 nmatches  �w 0 n  �v 0 	chkresult  �u 0 m  �t 0 loc  �s 0 len  �r 0 subtext  �q 0 	total_len  M �p�o�n�m�l�k�j�i�h�g�f�e�d�c��p 0 bare  �o &0 stringwithstring_ stringWithString_�n 0 _regexp  �m 
0 length  �l @0 matchesinstring_options_range_ matchesInString_options_range_�k 	0 count  
�j .ascrcmnt****      � ****
�i 
ctxt�h  0 objectatindex_ objectAtIndex_�g  0 numberofranges numberOfRanges�f 0 rangeatindex_ rangeAtIndex_�e 0 location  �d �c *0 substringwithrange_ substringWithRange_� �b  *�k+  k+ E�O)�,�jj��,lvm+ E�OjvE�OjE�O�j+ E�O�j O�j  ��&kvY hO wj�kkh �j O��k+ E�O Wj�j+ 	kkh �j O��k+ 
E[�,E�Z[�,E�ZO�� ��㨣�k+ E�O��&�6FY �6FO��E�[OY��[OY��O�j+ E�O�� ��㫣�k+ E�O��&�6FY hO� �b�  O�b 0 matchresult MatchResultO  PQRSTUVWXYP 	�a�`�_�^�]�\�[�Z�Y
�a .corecnte****       ****�` 0 capture  �_ 0 as_text  �^ 0 all_captures  �] 0 as_list  �\ 	0 range  �[ 0 	substring  �Z 0 substring_from  �Y 0 	make_with  Q �X��W�VZ[�U
�X .corecnte****       ****�W  �V  Z  [ �T�S�T 0 _result  �S  0 numberofranges numberOfRanges�U )�,j+ R �R��Q�P\]�O�R 0 capture  �Q �N^�N ^  �M�M 0 an_index  �P  \ �L�K�L 0 an_index  �K 0 a_range  ] �J�I�H�G�F�J 0 _result  �I 0 rangeatindex_ rangeAtIndex_�H 	0 _text  �G *0 substringwithrange_ substringWithRange_
�F 
ctxt�O )�,�k+ E�O)�,�k+ �&S �E�D�C_`�B�E 0 as_text  �D  �C  _  ` �A�A 0 capture  �B *jk+  T �@�?�>ab�=�@ 0 all_captures  �?  �>  a �<�;�:�< 0 a_result  �; 0 n_ranges  �: 0 n  b �9�8�7�9 0 _result  �8  0 numberofranges numberOfRanges�7 	0 group  �= -jvE�O)�,j+ E�O j�kkh *�k+ �6F[OY��O�U �6/�5�4cd�3�6 0 as_list  �5  �4  c  d �2�2 0 all_captures  �3 *j+  V �1;�0�/ef�.�1 	0 range  �0 �-g�- g  �,�, 0 an_index  �/  e �+�*�)�+ 0 an_index  �* 0 loc  �) 0 len  f �(�'�&�%�$�#�( 0 _result  �' 0 rangeatindex_ rangeAtIndex_�& 0 location  �% 
0 length  
�$ 
leng�# �. )�,�k+ E[�,E�Z[�,E�ZO���W �"b�!� hi��" 0 	substring  �! �j� j  ��� 0 loc  � 0 len  �   h ��� 0 loc  � 0 len  i �������� 	0 _text  � 0 location  � 
0 length  � � *0 substringwithrange_ substringWithRange_
� 
rslt
� 
ctxt� )�,���k+ O��&X ����kl�� 0 substring_from  � �m� m  �� 0 loc  �  k �� 0 loc  l ��
�	�� 	0 _text  �
 *0 substringfromindex_ substringFromIndex_
�	 
rslt
� 
ctxt� )�,�k+ O��&Y ����no�� 0 	make_with  � �p� p  ��� 0 check_result  � 0 
a_nsstring  �  n � �������  0 check_result  �� 0 
a_nsstring  �� 0 a_class  �� 00 chekcingresultinstance ChekcingResultInstanceo ���q�� 00 chekcingresultinstance ChekcingResultInstanceq ��r����st��
�� .ascrinit****      � ****r k     uu �vv �ww �����  ��  ��  s ������
�� 
pare�� 0 _result  �� 	0 _text  t ������
�� 
pare�� 0 _result  �� 	0 _text  �� b  N  Ob   �Ob  �� )E�O��K S� �������xy���� 0 make_match_result  �� ��z�� z  ������ 0 check_result  �� 0 
a_nsstring  ��  x ������ 0 check_result  �� 0 
a_nsstring  y ���� 0 	make_with  �� b  ��l+   �������{|���� 0 open_helpbook  ��  ��  { ������ 0 msg  �� 	0 errno  | 	���������}������
�� 
scpt
�� .earsffdralis        afdr�� 0 do  �� 0 msg  } ������
�� 
errn�� 	0 errno  ��  
�� .miscactvnull��� ��� null
�� 
ret 
�� .sysodisAaleR        TEXT�� - )��/ *)j k+ UW X  *j O��%�%j  �������~���� 	0 debug  ��  ��  ~   �������� 0 	make_with  �� 	0 split  �� *�k+  *�k+ U �����������
�� .aevtoappnull  �   � ****��  ��  �  � ���� 0 open_helpbook  �� *j+  ascr  ��ޭ