import {Request,Response} from "express"
import { getTweetRepo,createTweetRepo,deleteTweetRepo,updateTweetRepo, getAllTweetsRepo } from "../repositories/tweet.repository"
import { ITweetInterface } from "../database/interfaces/tweet.interface"
import { updateUserwithTweetIdRepo } from "../repositories/user.repository"
export const getTweetController=async(req:Request,res:Response)=>{
    const tweetId=req.params.tweetId as string;
try {
const tweet= await getTweetRepo(tweetId)
if(tweet){
    res.status(200).json({"data":tweet})

}
else{
    res.status(500).json({"error":"Tweet not found"})
}

}
catch(error){
    console.log(error);
res.status(500).json({"error":error})
}
}


export const createTweetController=async(req:Request,res:Response)=>{
    const tweet:ITweetInterface=req.body ;
try {
const success= await createTweetRepo(tweet)
if(success){
    const userUpdateSuccess=await updateUserwithTweetIdRepo(tweet.adminId,tweet.tweetId)
    if(userUpdateSuccess){
    res.status(200).json({"data":tweet})}
    else{
        res.status(500).json({"error":"User not updated"})
    }

}
else{
    res.status(500).json({"error":"Tweet not created"})
}

}
catch(error){
    console.log(error);
res.status(500).json({"error":error})
}
}

export const updateTweetController=async(req:Request,res:Response)=>{
    const updatedTweet:ITweetInterface=req.body ;
try {
const success= await updateTweetRepo(updatedTweet.tweetId,updatedTweet)
if(success){

    res.status(200).json({"data":updatedTweet})

}
else{
    res.status(500).json({"error":"Tweet not created"})
}

}
catch(error){
    console.log(error);
res.status(500).json({"error":error})
}
}
export const deleteTweetController=async(req:Request,res:Response)=>{
    const tweetId=req.params.tweetId as string;
try {
const tweet= await deleteTweetRepo(tweetId)
if(tweet){
    res.status(200).json({"data":"Tweet deleted"})

}
else{
    res.status(500).json({"error":"Tweet not deleted"})
}

}
catch(error){
    console.log(error);
res.status(500).json({"error":error})
}
}


export const getAllTweetsController = async (req: Request, res: Response) => {
    try {
      const tweets = await getAllTweetsRepo();
      if (tweets) {
        res.status(200).json({ data: tweets });
      } else {
        res.status(500).json({ error: "Tweets Not Found" });
      }
    } catch (error) {
      console.log(error);
      res.status(500).json({ error: error });
    }
  };