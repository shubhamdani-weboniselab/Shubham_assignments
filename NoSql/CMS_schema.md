## Content management system


users {
	role_id : id
	user_name : string
	date_of_creation: timestamps
	email: String
	password: String
	
	user_profile {
	_id : objectId of user e.g. user._id
	profile_image: "blob or url"
	pagesLiked: ["Arrays of Liked Pages"]
	addressess : [
		local_address: {
			houseNumber: "Numbers" 
			streetName: String
			city: String
			state: String
			pincode: numbers
				}
		permanentAddress: {
			houseNumber: "Numbers" 
			streetName: String
			city: String
			state: String
			pincode: numbers
		}
		]

	phoneNo : {
		number1: Numbers
		number2: Numbers
		}
	
}
}




roles {

	_id = objectid of user e.g. user._id
	role_type: "either super admin || admin || editor"
	super admin: "read, write, edit, delete, manipulate"
	admin: "read , write, edit, delete"
	editor: "read , write ,"
}


pages {

	page_id : objectId
	title: String
	pageowner = userIds
	createdtime: timestamp;
	usersassociated:["Array of UserIds"];
	slug = String
	text: String
	likescount : int

	comments : {
		pageId: ObjectId
		id = ObjectID
		title: String
		owner: "UserID eg: User._id"
		likesCount: int
	
		}
}


