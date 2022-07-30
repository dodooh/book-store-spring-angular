-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: book_store
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Nguyễn Nhật Ánh'),(2,'Higashino Keigo'),(3,'Peter Swanson'),(4,'Yoo Eun Jung'),(5,'Minh Niệm'),(6,'Sir Arthur Conan Doyle'),(7,'John E. Douglas, Mark Olshaker'),(8,'Cao Minh'),(9,'Đặng Hoàng Giang');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `book_id` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` longtext,
  `dimension` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `publisher_date` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `total_page` int DEFAULT NULL,
  `translator` varchar(255) DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `publisher_id` int DEFAULT NULL,
  `flag` bit(1) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `FKklnrv3weler2ftkweewlky958` (`author_id`),
  KEY `FKam9riv8y6rjwkua1gapdfew4j` (`category_id`),
  KEY `FKgtvt7p649s4x80y6f4842pnfq` (`publisher_id`),
  CONSTRAINT `FKam9riv8y6rjwkua1gapdfew4j` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FKgtvt7p649s4x80y6f4842pnfq` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`),
  CONSTRAINT `FKklnrv3weler2ftkweewlky958` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('BK-0001','p109017985','NẾU MỘT NGÀY ANH THẤY TÔI ĐIÊN, THỰC RA CHÍNH LÀ ANH ĐIÊN ĐẤY!\nHỡi những con người đang oằn mình trong cuộc sống, bạn biết gì về thế giới của mình? Là vô vàn thứ lý thuyết được các bậc vĩ nhân kiểm chứng, là luật lệ, là cả nghìn thứ sự thật bọc trong cái lốt hiển nhiên, hay những triết lý cứng nhắc của cuộc đời?\n\nLại đây, vượt qua thứ nhận thức tẻ nhạt bị đóng kín bằng con mắt trần gian, khai mở toàn bộ suy nghĩ, để dòng máu trong bạn sục sôi trước những điều kỳ vĩ, phá vỡ mọi quy tắc. Thế giới sẽ gọi bạn là kẻ điên, nhưng vậy thì có sao? Ranh giới duy nhất giữa kẻ điên và thiên tài chẳng qua là một sợi chỉ mỏng manh: Thiên tài chứng minh được thế giới của mình, còn kẻ điên chưa kịp làm điều đó. Chọn trở thành một kẻ điên để vẫy vùng giữa nhân gian loạn thế hay khóa hết chúng lại, sống mãi một cuộc đời bình thường khiến bạn cảm thấy hạnh phúc hơn?\n\nThiên tài bên trái, kẻ điên bên phải là cuốn sách dành cho những người điên rồ, những kẻ gây rối, những người chống đối, những mảnh ghép hình tròn trong những ô vuông không vừa vặn… những người nhìn mọi thứ khác biệt, không quan tâm đến quy tắc. Bạn có thể đồng ý, có thể phản đối, có thể vinh danh hay lăng mạ họ, nhưng điều duy nhất bạn không thể làm là phủ nhận sự tồn tại của họ. Đó là những người luôn tạo ra sự thay đổi trong khi hầu hết con người chỉ sống rập khuôn như một cái máy. Đa số đều nghĩ họ thật điên rồ nhưng nếu nhìn ở góc khác, ta lại thấy họ thiên tài. Bởi chỉ những người đủ điên nghĩ rằng họ có thể thay đổi thế giới mới là những người làm được điều đó.\n\nChào mừng đến với thế giới của những kẻ điên.\n\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....','16 x 24 cm','https://salt.tikicdn.com/cache/w1200/ts/product/7c/e8/34/4d3636aadb471cad0bf2f45d681e4f23.jpg','Thiên Tài Bên Trái',89500,'2021-06-01',34,424,'Thu Hương',8,4,6,_binary ''),('BK-0002','p117254517','“Tôi sợ những cơn của mình, chúng xâm chiếm não bộ tôi, nhấn chìm lý trí của tôi, chúng phơi bày sự đau đớn, cô đơn, nỗi sầu thảm suốt những năm tháng niên thiếu của tôi, sự ám ảnh của bạo lực, của lẻ loi, của tức giận vì chẳng được ai giúp đỡ. Trong những giấc mơ, tôi thét lên với mọi người, cố gắng diễn đạt sự sợ hãi và tuyệt vọng của mình, nhưng không ai hiểu.”\n\nĐại dương đen là hành trình nhẫn nại của tác giả Đặng Hoàng Giang cùng người trầm cảm, kể cho chúng ta câu chuyện vừa dữ dội vừa tê tái về những số phận, mà vì định kiến và sự thiếu hiểu biết của chính gia đình và xã hội, đã bị tước đi quyền được sống với nhân phẩm, được cống hiến, được yêu thương và hạnh phúc.\n\nLà tiếng nói chia sẻ hiếm hoi với thế giới của người trầm cảm, là lời kêu gọi xóa bỏ định kiến xã hội, Đại dương đen đồng thời là công trình giáo dục tâm lý, cung cấp kiến thức căn bản về trầm cảm, hình hài nó thế nào, nó từ đâu tới, nó có thể phá hủy ra sao, có những phương thức trị liệu nào, và mỗi chúng ta có thể làm gì để những người không may mắn được sống an hòa với nhân phẩm của mình.\n\nTÁC GIẢ:\n\nTiến sĩ Đặng Hoàng Giang là chuyên gia phát triển, nhà hoạt động xã hội và tác giả chính luận. Các hoạt động nghiên cứu và vận động chính sách của anh nhằm nâng cao chất lượng quản trị quốc gia và thúc đẩy tiếng nói của người dân. Anh nỗ lực mở rộng không gian xã hội dân sự, truyền bá tri thức, phá bỏ định kiến và kỳ thị, góp phần xây dựng một xã hội khoan dung và trắc ẩn.\n\nĐặng Hoàng Giang tốt nghiệp kỹ sư tin học tại Đại học Công nghệ Ilmenau, Đức, và có bằng tiến sĩ kinh tế phát triển của Đại học Công nghệ Vienna, Áo. Những cuốn sách và bài viết của anh có sức ảnh hưởng rộng rãi trong xã hội.\n\nCùng tác giả:\n\nBức xúc không làm ta vô can (Nhã Nam, 2015)\nThiện, Ác và Smartphone (Nhã Nam, 2017)\nĐiểm đến của cuộc đời (Nhã Nam, 2018)\nTìm mình trong thế giới hậu tuổi thơ (Nhã Nam, 2020)\n \n\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....','14 x 20.5 cm','https://salt.tikicdn.com/cache/w1200/ts/product/f7/fb/9a/e8b9a94478dc887c4b84b6b6439f6335.jpg','Đại Dương Đen - Những Câu Chuyện Từ Thế Giới Của Trầm Cảm\n',156000,'2021-08-15',200,322,NULL,9,4,7,_binary ''),('BK-0003','p57761618','Một tác phẩm đậm chất trinh thám cổ điển vua trinh thám Nhật Bản Keigo Higashino.\n\nBản di chúc về khối tài sản kếch xù của ông Ichigahara Takaaki sẽ được công bố vào đúng lễ 49 ngày của ông tại lữ quán Kairotei, nơi sinh thời ông vô cùng yêu mến. Nhưng một lá thư hé lộ sự thật bị chôn vùi dưới lớp tro tàn của vụ hỏa hoạn ở lữ quán này nửa năm trước, xuất hiện đúng buổi tối trước ngày công bố di chúc đã khiến mọi chuyện trở nên rối tung. Cũng trong đêm đó, một người đã bị sát hại. Ngọn lửa ngờ vực bắt đầu âm ỉ cháy lan, một thảm kịch khác đã được soạn sẵn và chờ hồi kết để hạ mà\n\nGiới thiệu tác giả:\n\nHigashino Keigo là tiểu thuyết gia trinh thám hàng đầu Nhật Bản với nhiều tác phẩm hàng triệu bản bán ra trong và ngoài nước, gặt hái vô vàn giải thưởng. Ông từng là Chủ tịch thứ 13 của Hội nhà văn Trinh thám Nhật Bản từ năm 2009 tới năm 2013.\n\nMỗi tác phẩm của ông đều có phong cách khác nhau, nhưng nhìn chung đều có diễn biến bất ngờ, khắc họa tâm lý nhân vật sâu sắc, làm nên nét riêng biệt trong chất văn của Higashino Keigo.\n\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....','15 x 24 cm','https://salt.tikicdn.com/cache/w1200/ts/product/d3/43/d1/1f95dc535f7a34941fe47cad69928ecc.jpg','Vụ Án Mạng Ở Lữ Quán Kairotei',79950,'2021-08-15',120,292,NULL,2,1,1,_binary ''),('BK-0004','p76278485','“Chúng ta không còn lựa chọn nào khác, chỉ có thể đi trên con đường ở trong bóng tối. Dẫu cho bốn phía xung quanh sáng rực như ban ngày, cũng chỉ là ánh sáng không chân thực mà thôi.”\n\nĐể thoát một khoản nợ, Masaya đã lợi dụng trận động đất kinh hoàng để giết chết ông cậu rồi dàn dựng thành một vụ tai nạn. Nhưng tất cả không qua được mắt Mifuyu, cô gái bí ẩn nhà hàng xóm. Mang theo bí mật của Masaya, Mifuyu cùng anh lên Tokyo, bỏ lại sau lưng một Kyoto hoang tàn sau cơn địa chấn.\n\nSong ở nơi đô hội là một chuỗi bi kịch nối tiếp nhau, nơi bóng đen của tội ác trong quá khứ như vũng dầu loang, vĩnh viễn không bao giờ xóa sạch, ngày một lan rộng. Bí ẩn nối liền bí ẩn, mọi người tiếp cận Mifuyu đều gặp chuyện không may, những ai chạm đến quá khứ của cô đều mất tích.\n\nRốt cuộc, cô gái bí ẩn luôn sát cánh bên Masaya trong bóng đêm tăm tối là ai?\n\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....','15 x 24 cm','https://salt.tikicdn.com/cache/w1200/ts/product/9e/01/6f/a0bb7085a45d4cda06c7424c5288b35b.jpg','Ảo Dạ ',116350,'2021-01-20',201,584,NULL,2,1,1,_binary ''),('BK-0005','p110448020','Ở một thị trấn không tên, ảm đạm chẳng ai buồn ghé đến, hy vọng đổi đời nhờ một kế hoạch phát triển du lịch vô tiền khoáng hậu đã sụp đổ tan tành khi trận đại dịch tràn tới. Virus Corona làm đảo lộn cuộc sống, gieo rắc nỗi sợ hãi, khơi dậy bóng tối lẩn lút trong lòng người.\nGiữa bối cảnh đó, một vụ án mạng kỳ lạ xảy ra. Cảnh sát lặng im. Bí ẩn chồng chất bí ẩn. Hung thủ là ai? m mưu nào đang bao trùm thị trấn bé nhỏ này?\n\nĐã đến lúc “nhà ảo thuật đen” trổ tài! Với trí tuệ hơn người và những ngón xảo thuật ma mãnh, gã thách thức cảnh sát, tuyên bố sẽ tự mình tìm ra hung thủ\n\nTÁC GIẢ:\nHigashino Keigo sinh năm 1958 tại Osaka, là nhà văn trinh thám hàng đầu hiện nay tại Nhật. Năm 1985, Higashino Keigo giành Giải Edogawa Rampo lần thứ 31 cho tác phẩm trinh thám hay nhất với tiểu thuyết Giờ tan học.\n\nCác năm sau đó, Higashino Keigo liên tục được đề cử vô số các giải thưởng văn học lớn. Năm 1999, ông đoạt giải Mystery Writers of Japan Inc với tiểu thuyết Bí mật của Naoko, và năm 2006, là giải Naoki lần thứ 134 cho Phía sau nghi can X.\n\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....','14 x 20.5 cm','https://salt.tikicdn.com/cache/w1200/ts/product/35/a0/e0/01baad28325887ae85e02590f98c4008.jpg','Nhà Ảo Thuật Đen Và Vụ Án Mạng Tại Thị Trấn Không Tên',129350,'2021-07-01',23,440,'Mai Khanh',2,1,3,_binary ''),('BK-0006','p50414368','Tình cờ phát hiện những điều bất thường sau cái chết thảm khốc của người yêu, nhân vật “tôi”, một nữ nhà văn viết tiểu thuyết trinh thám đã cùng bạn mình, Hagio Fuyuko, cũng là biên tập viên phụ trách sách của “tôi” quyết định điều tra về cái chết này. Trong quá trình điều tra hai người phát hiện người yêu của “tôi” đã từng gặp tai nạn lật thuyền trong chuyến du lịch đảo một năm trước. Và khi họ tìm tới những người cũng tham gia chuyến đi đó để tìm hiểu thì những người này cũng lần lượt bị sát hại. Cuối cùng “tôi” buộc phải tự mình phán đoán, điều tra để tìm ra chân tướng sự việc.\n\nÁn mạng mười một chữ cũng đã được chuyển thể thành phim truyền hình vào năm 2011.\n\nGIỚI THIỆU TÁC GIẢ:\n\nHigashino Keigo là tiểu thuyết gia trinh thám hàng đầu Nhật Bản với nhiều tác phẩm hàng triệu bản bán ra trong và ngoài nước, gặt hái vô vàn giải thưởng. Ông từng là Chủ tịch thứ 13 của Hội nhà văn Trinh thám Nhật Bản từ năm 2009 tới năm 2013.\n\nMỗi tác phẩm của ông đều có phong cách khác nhau, nhưng nhìn chung đều có diễn biến bất ngờ, khắc họa tâm lý nhân vật sâu sắc, làm nên nét riêng biệt trong chất văn của Higashino Keigo.\n\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....','14 x 20.5','https://salt.tikicdn.com/cache/w1200/ts/product/32/2e/b7/fcd82c276d5e2a662ccadc1fb7e26cb4.jpg','Án Mạng Mười Một Chữ',71500,'2020-03-02 ',12,260,NULL,2,1,3,_binary ''),('BK-0007','p103379147','Osuke, chủ một tiệm cầm đồ bị sát hại tại một ngôi nhà chưa hoàn công, một triệu yên mang theo người cũng bị cướp mất.\n\nSau đó một tháng, nghi can Fumiyo được cho rằng có quan hệ tình ái với nạn nhân và đã sát hại ông để cướp một triệu yên, cũng chết tại nhà riêng vì ngộ độc khí ga. Vụ án mạng ông chủ tiệm cầm đồ rơi vào bế tắc và bị bỏ xó.\n\nNhưng với hai đứa trẻ mười một tuổi, con trai nạn nhân và con gái nghi can, vụ án mạng năm ấy chưa bao giờ kết thúc. Sinh tồn và trưởng thành dưới bóng đen cái chết của bố mẹ, cho đến cuối đời, Ryoji vẫn luôn khao khát được một lần đi dưới ánh mặt trời, còn Yukiho cứ ra sức vẫy vùng rồi mãi mãi chìm vào đêm trắng.\n\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....','15 x 24 cm','https://salt.tikicdn.com/cache/w1200/ts/product/80/67/af/753a66ef25086f469826f3ee4716f751.jpg','Bạch Dạ Hành',135000,'2021-06-01 ',152,628,'Diệu Thư',2,1,4,_binary ''),('BK-0008','p121635152','KHÔNG AI CÓ THỂ LÀM BẠN TỔN THƯƠNG TRỪ KHI BẠN CHO PHÉP – YOO EUN JUNG\n\nChúng ta vẫn thường nghĩ mình sẽ chỉ hạnh phúc khi ở bên cạnh ai đó và nhận được yêu thương từ họ. Nhưng thực chất, hạnh phúc đơn giản chỉ là biết trân trọng bản thân và tận hưởng niềm vui trong chính cuộc sống mà bạn mong ước. Vậy nên, hãy nhớ rằng không ai có thể làm bạn tổn thương, trừ khi bạn cho phép.\n\nLà người đang nghiên cứu và điều trị tâm lý, tác giả Yoo Eun Jung đã chỉ ra góc nhìn hoàn toàn khác về các vấn đề mà bạn gặp phải trong mối quan hệ với những người xung quanh. Quyển sách này vừa chứa đựng những lời tâm tình thủ thỉ của một người bạn, vừa đưa ra các liệu pháp cứng rắn ở cương vị một chuyên gia giúp bạn lần lượt gỡ bỏ những vướng mắc trong lòng. Nếu không phải là đơn thuốc hữu hiệu nhất cho những ai đang cảm thấy mệt mỏi với các mối quan hệ thì nó cũng sẽ là một viên vitamin, hay một viên thuốc bổ để bạn có thể mang theo và bổ sung như một loại dưỡng chất hàng ngày cho tâm lý nhờ những chia sẻ về:\n\n1. Những hội chứng tâm lý có thể bạn đang vô tình mắc phải khiến cuộc sống không được như ý\n2. Mẹo ứng xử trong giao tiếp với đa dạng các mối quan hệ\n3. Cách đánh giá tầm quan trọng của bạn trong mắt đối phương\n4. Những cách để tôn trọng bản thân nhưng không làm mất lòng đối phương\n5. Căn nguyên của căn bệnh trầm cảm và cách để không lún sâu vào sự trầm uất\n\nMong bạn luôn giữ cho mình đủ sự thanh thản trong tâm hồn để biết ơn mỗi phút giây được sống, đủ quyết tâm để không đối xử tệ với bản thân cũng như đủ can đảm để bộc lộ những điều bản thân đang mưu cầu. Hãy bình tâm bước và nỗ lực không ngừng vì những điều bản thân mong muốn đạt được, bạn sẽ tự khắc thấy mình hạnh phúc hơn.\n\nVề tác giả: Yoo Eun Jung\n\nChủ tịch Hội đồng học thuật của Hiệp hội Điều trị Béo phì và Thẩm mỹ Hàn Quốc, và là thành viên ban chỉ đạo của Hiệp hội Tâm thần Cơ đốc giáo Hàn Quốc. Cô ấy đặc biệt quan tâm đến lĩnh vực chánh niệm, giải phóng bản thân khỏi những phiền nhiễu bằng cách tập trung vào “ở đây và ngay bây giờ”. Hiện cô đang nghiên cứu điều trị tâm lý thông qua cách này.\n\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....\n\n','14.5 x 20.5 cm','https://salt.tikicdn.com/cache/w1200/ts/product/0c/ff/1f/091c739d2cc4c1b2a3a9c5025930adcc.jpg','Không Ai Có Thể Làm Bạn Tổn Thương Trừ Khi Bạn Cho Phép',59500,'2021-09-01',123,304,'Sun Tzô',4,2,5,_binary ''),('BK-0009','p42877486','Peter Pan được biết đến là đứa trẻ không bao giờ lớn. Anh chàng dạy 3 đứa trẻ là Wendy, John và Micheal học bay. Nhân lúc bố mẹ không có nhà, chúng đã bay đến xứ sở Neverland bí ẩn. Trên đảo có các nàng tiên nhỏ, đám cướp biển và các nàng tiên cá mà các em nhỏ đã quen thuộc trong truyện cổ tích.\n\nTrong câu chuyện, Peter và các bạn nhỏ được cùng nhau vui chơi và trải qua những chuyến du lịch mạo hiểm nhưng không kém phần thú vị. Thông qua hình tượng nhân vật Peter Pan, độc giả sẽ nhận ra rằng: tuổi thơ ấu là một áng văn chương tươi đẹp nhất, mơ mộng nhất trong một cuốn sách lớn của đời người. Mỗi bạn nhỏ, hãy tự viết cho mình một cuốn sách cuộc đời và tận hưởng những niềm vui thuộc về bản thân.\n\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....','17 x 24 cm','https://salt.tikicdn.com/cache/w1200/ts/product/73/c0/b6/e241d62e95631c52f92175373ec3fdce.jpg','Văn Học Kinh Điển Thế Giới - Peter Pan',71000,'2019-01-11',62,144,NULL,3,1,3,_binary ''),('BK-0010','p156824934','HỌ ĐI CẢ RỒI, CUỐI CÙNG TÔI CŨNG ĐƯỢC NGỒI LẠI MỘT MÌNH. PHÍA TRƯỚC LÀ ĐÊM DÀI THĂM THẲM, VÀ TÔI KHÔNG MUỐN LÃNG PHÍ MỘT GI Y PHÚT NÀO ƯỚC SAO ĐÊM NAY THẬT DÀI, DÀI NHƯ QUÃNG ĐỜI TÔI ĐÃ ĐI QUA…\n\nKhi chàng trai trẻ Thomas Peaceful hồi tưởng lại quãng đời thơ ấu của mình từ nơi chiến trường của Thế chiến thứ nhất, kí ức trong anh ngập tràn hình ảnh gia đình giữa vùng quê yên ả. Nhưng đồng hồ đang gõ nhịp, và cứ mỗi khoảnh khắc trôi qua khi Tommo nhớ về ngày xưa, thì một thời khắc khác càng lúc càng đến gần, một điều sẽ đổi thay cuộc đời anh mãi mãi\n\nMỘT CUỐN TIỂU THUYẾT VÔ CÙNG S U SẮC VỀ THẾ CHIẾN THỨ NHẤT.\n\n“ Một bức chân dung cảm động về tình chí thân và lòng dũng cảm, nét ngây thơ và sự hung tàn.” – TELEGRAPH –\n\n“Được viết nên từ con tim.” – OBSERVER –\n\nTác giả: Michael Morpurgo là nhà văn, nhà thơ nổi tiếng ở Anh. Ông đã viết hơn 100 cuốn sách, được dịch ra 25 thứ tiếng và đoạt nhiều giải thưởng uy tín. Trong số đó có tiểu thuyết Chiến mã (War Horse) được Hollywood dựng thành phim. Ông và vợ đã sáng lập Hội từ thiện Farms for City Children (tạm dịch: Nông trại cho trẻ em thành phố).\n\nBINH NHÌ PEACEFUL đã đoạt nhiều giải thưởng văn học, trong đó có giải thưởng Blue Peter - cuốn sách hay nhất năm 2005 và được đưa vào chương trình văn học phổ thông dành cho học sinh lớp 7 tại Anh Quốc. Tác phẩm đã được đạo diễn người Anh Pat O\'Connor chuyển thể thành phim cùng tên, ra mắt năm 2012.\n\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....','13.5 x 20.5 cm','https://salt.tikicdn.com/cache/w1200/ts/product/8c/fd/bb/b54a360424bd520ee2bef17a6977b561.jpg','Binh Nhì Peaceful (Giải Thưởng Văn Học Blue Peter)',50000,'2021-01-01',51,200,'Ngữ Anh',3,3,2,_binary ''),('BK-0011','p135017969','HỌ ĐI CẢ RỒI, CUỐI CÙNG TÔI CŨNG ĐƯỢC NGỒI LẠI MỘT MÌNH. PHÍA TRƯỚC LÀ ĐÊM DÀI THĂM THẲM, VÀ TÔI KHÔNG MUỐN LÃNG PHÍ MỘT GI Y PHÚT NÀO ƯỚC SAO ĐÊM NAY THẬT DÀI, DÀI NHƯ QUÃNG ĐỜI TÔI ĐÃ ĐI QUA…\n\nKhi chàng trai trẻ Thomas Peaceful hồi tưởng lại quãng đời thơ ấu của mình từ nơi chiến trường của Thế chiến thứ nhất, kí ức trong anh ngập tràn hình ảnh gia đình giữa vùng quê yên ả. Nhưng đồng hồ đang gõ nhịp, và cứ mỗi khoảnh khắc trôi qua khi Tommo nhớ về ngày xưa, thì một thời khắc khác càng lúc càng đến gần, một điều sẽ đổi thay cuộc đời anh mãi mãi\n\nMỘT CUỐN TIỂU THUYẾT VÔ CÙNG S U SẮC VỀ THẾ CHIẾN THỨ NHẤT.\n\n“ Một bức chân dung cảm động về tình chí thân và lòng dũng cảm, nét ngây thơ và sự hung tàn.” – TELEGRAPH –\n\n“Được viết nên từ con tim.” – OBSERVER –\n\nTác giả: Michael Morpurgo là nhà văn, nhà thơ nổi tiếng ở Anh. Ông đã viết hơn 100 cuốn sách, được dịch ra 25 thứ tiếng và đoạt nhiều giải thưởng uy tín. Trong số đó có tiểu thuyết Chiến mã (War Horse) được Hollywood dựng thành phim. Ông và vợ đã sáng lập Hội từ thiện Farms for City Children (tạm dịch: Nông trại cho trẻ em thành phố).\n\nBINH NHÌ PEACEFUL đã đoạt nhiều giải thưởng văn học, trong đó có giải thưởng Blue Peter - cuốn sách hay nhất năm 2005 và được đưa vào chương trình văn học phổ thông dành cho học sinh lớp 7 tại Anh Quốc. Tác phẩm đã được đạo diễn người Anh Pat O\'Connor chuyển thể thành phim cùng tên, ra mắt năm 2012.\n\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....','17 x 24 cm','https://salt.tikicdn.com/cache/w1200/ts/product/51/ae/c2/4fecda97b6ad7849478a436f3f36a097.jpg','Bản Đồ Tâm Hồn Con Người Của Jung',160000,'2021-10-01',12,446,NULL,4,3,3,_binary ''),('BK-0012','p89204262','Một ý niệm về nỗi buồn là một cuốn sách hoàn toàn mới về một vấn đề mà nhiều người còn mơ hồ.\n\nCuốn sách trở nên nổi tiếng toàn cầu sau khi được thành viên SUGA (BTS) cầm đọc trong khoảng thời gian chờ đợi lịch trình và được các phóng viên ghi lại.\n\nĐược viết theo lối trò chuyện tâm tình, đôi khi cảm động sâu sắc, đôi khi thú vị đáng ngạc nhiên và luôn thực tế, cuốn sách bao gồm một loạt các vấn đề mà người đang đau buồn phải đối mặt.\n\nMarasco và Shuff đã nỗ lực đưa tác phẩm đến với những độc giả muốn biết thêm về chủ đề phức tạp này. Sử dụng nhiều nguồn khác nhau, bao gồm sách, phim, nhạc và dành nhiều giờ trò chuyện với những người đang đau buồn, hai tác giả đã chắt lọc những hiểu biết chân thực của họ thành một loạt các bài luận ngắn, một chủ đề có thể dễ dàng đọc được trong một lần ngồi đọc – dạng thức mà họ nhận thấy những người đang đau buồn ưa chuộng hơn.\n\nCuốn sách này không được viết bởi các bác sĩ lâm sàng, vì vậy không có nhiều thuật ngữ chuyên ngành. Như một độc giả gần đây đã nói về Một ý niệm về nỗi buồn: “Đọc cuốn sách này giống như có một người bạn thông minh, vui tính ở bên cạnh đúng lúc bạn thực sự cần một người bạn.”\n\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....','14.5 x 20.5 cm','https://salt.tikicdn.com/cache/w1200/ts/product/1f/b6/81/10fe46000941d79d161d1e74387ba3bf.jpg','Một Ý Niệm Về Nỗi Buồn',86100,'2021-04-01',56,284,NULL,6,3,2,_binary '');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `date_create` varchar(255) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `address_receive` varchar(255) DEFAULT NULL,
  `name_receive` varchar(255) DEFAULT NULL,
  `phone_receive` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FKdebwvad6pp1ekiqy5jtixqbaj` (`customer_id`),
  CONSTRAINT `FKdebwvad6pp1ekiqy5jtixqbaj` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_detail`
--

DROP TABLE IF EXISTS `cart_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_detail` (
  `cart_detail_id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `book_id` varchar(255) DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  PRIMARY KEY (`cart_detail_id`),
  UNIQUE KEY `CART_BOOK_UK` (`book_id`,`cart_id`),
  KEY `FKrg4yopd2252nwj8bfcgq5f4jp` (`cart_id`),
  CONSTRAINT `FKflpu1psdex9le27p7owju2piw` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  CONSTRAINT `FKrg4yopd2252nwj8bfcgq5f4jp` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_detail`
--

LOCK TABLES `cart_detail` WRITE;
/*!40000 ALTER TABLE `cart_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Trình thám'),(2,'Tác phẩm kinh điển'),(3,'Truyện dài'),(4,'Truyện Ngắn'),(5,'Tâm Linh'),(6,'Self-help'),(7,'Lịch sử'),(8,'Tiểu thuyết');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` varchar(255) NOT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `customer_username` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `FKq19kmuvhitjdved4qca4j7mxp` (`customer_username`),
  CONSTRAINT `FKq19kmuvhitjdved4qca4j7mxp` FOREIGN KEY (`customer_username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('CS-0001','1997-01-26',_binary '','Thanh Nghia','nghiantt','nghiantt.dng@gmail.com','0935151766','12 Hoàng Diệu, Đà Nẵng'),('CS-0002','1997-01-26',_binary '','Quang Huu','huungq','huunq.dng@gmail.com','0936665214','45 Núi Thành, Đà Nẵng'),('CS-0003','2022-07-05',_binary '','Pham Viet Khoa','khoapv','khoapv.qng@gmail.com','0955111554','56 Lê Độ, Đà Nẵng'),('CS-0004','2022-07-04',_binary '','Chau My','mychau','chaumy.dng@gmail.com','0956474145','89 Nguyễn Tri Phương, Đà Nẵng');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Nhã Nam'),(2,'Kim Đồng'),(3,'Trẻ'),(4,'Phụ Nữ Việt Nam'),(5,'Thanh Niên'),(6,'Thế Giới'),(7,'Hội Nhà Văn');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_USER'),(2,'ROLE_EMPLOYEE');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_role_id` int NOT NULL AUTO_INCREMENT,
  `role` int DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `FKfhq23r1o3cqe0n8jdi4vyv4s8` (`role`),
  KEY `FK2svos04wv92op6gs17m9omli1` (`username`),
  CONSTRAINT `FK2svos04wv92op6gs17m9omli1` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
  CONSTRAINT `FKfhq23r1o3cqe0n8jdi4vyv4s8` FOREIGN KEY (`role`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (3,1,'nghiantt'),(4,1,'huungq'),(5,1,'khoapv'),(7,1,'mychau');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(30) NOT NULL,
  `flag` bit(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('huungq',_binary '','$2a$10$c.4P3kEldjCeWNA/B88JWOjKRmYwqQcc5l7wMNbhBZHVgoERc.Jx2'),('khoapv',_binary '','$2a$10$f8G1nzYrvPdKLw1mgQ728uo6Uu9frtEahdI.YHcctsRkZATP9tb.G'),('mychau',_binary '','$2a$10$0LC1t5GltpKwXT9Op74rROc0RqGhE.Ww20G8Y3PGirrEztcA1P2Vu'),('nghiantt',_binary '','$2a$10$1BwGpAlzZmoRNzr7tMfSJ.UdxaR2tKus1Ll9eJ8lJ0HPiXrsZHiPS');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-30 20:59:02
