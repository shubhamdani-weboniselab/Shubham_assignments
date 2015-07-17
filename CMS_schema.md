## Content management system


User {
	_id : ObjectID
	UserName : String
	DateOfCreation: timestamps
	Email: String
	Password: String
	
}

User_profile {
	_id : ObjectId of User e.g. User._id
	UserName: String
	Profile_image: "blob or url"
	PagesLiked: ["Arrays of Liked Pages"]
	Addressess : [
		localAddress: {
			HouseNumber: "Numbers" 
			StreetName: String
			City: String
			State: String
			Pincode: numbers
				}
		PermanentAddress: String
		]

	PhoneNo : {
		Number1: Numbers
		Number2: Numbers
		}
	
}


Roles {
	_id = ObjectId of User e.g. User._id
	Role_type: "Either Super Admin || Admin || editor"
}


Pages {
	Id : ObjectId
	Title: String
	CreatedTime: timestamp;
	UsersAssociated: ["Array of UserIds"];
	Slug = String
	Text: String
}

Comments {
	id = ObjectID
	Title: String
	Owner: "UserID eg: User._id"
	LikesCount: int
	
}
