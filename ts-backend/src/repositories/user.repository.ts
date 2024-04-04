import mongoose from "mongoose"
import UserModel from "../database/models/user.model"
import { IUserInterface } from "../database/interfaces/user.interface"


export const getUserRepo =async(userId:string):Promise<IUserInterface | null> =>
{
    try{
const user =await UserModel.findOne({uid:userId})
return user;
    }
    catch(error){
        console.log(error)
        return null;
    }
}

export const deleteUserRepo =async(userId:string):Promise<boolean> =>
{
    try{
const deleted =await UserModel.findOneAndDelete({uid:userId})
if (deleted)
return true;
else
return false;
    }
    catch(error){
        console.log(error)
        return false;
    }
}


export const createUserRepo =async(user:IUserInterface):Promise<Boolean> =>
{
    try{
await UserModel.create(user);
return true;
    }
    catch(error){
        console.log(error)
        return false;
    }
}

export const updateUserRepo =async(userId:string,updatedUser:IUserInterface): Promise<Boolean>=>
{
    try{
const result=await UserModel.findOneAndUpdate({uid:userId},updatedUser,{new:true});
if(result){
    return true;
}
else{false};
    }
    catch(error){
        console.log(error)
        return false;
    }
    return false;
}

export const updateUserwithTweetIdRepo =async(userId:string,tweetId:String): Promise<Boolean>=>
{
    
    try{
const result=await UserModel.findOneAndUpdate({uid:userId},{$push: {tweets: tweetId}},{new:true});
if(result){
    return true;
}
else{false};
    }
    catch(error){
        console.log(error)
        return false;
    }
    return false;
}