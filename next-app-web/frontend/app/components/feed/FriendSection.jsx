'use client'

import { FaUserFriends } from "react-icons/fa";
import FriendCard from "./FriendCard";
import { useEffect, useState } from 'react';
import { firestore } from '../../firebase';
import { getDocs, collection } from "firebase/firestore";

async function fetchDataFromFirestore() {
    const querySnapshot = await getDocs(collection(firestore, "user"));
    const data = [];
    querySnapshot.forEach((doc) => {
        data.push({ id: doc.id, ...doc.data() });
    })
    return data;
}

export default function FriendSection() {
    const [users, setUsers] = useState([]);
    useEffect(() => {
        const fetchUsers = async () => {
            const data = await fetchDataFromFirestore();
            setUsers(data);
        };
        fetchUsers();
    }, []);
    return (
        <div className="right-0 bg-[#1D1D41] min-h-screen min-w-[80px] max-w-[300px] w-[80px] md:w-[300px] p-4 text-white rounded-xl fixed flex flex-col items-center">
            <h1 className="flex flex-row-reverse gap-4 items-center"><FaUserFriends className="text-3xl" /><span className="md:block hidden text-lg">Friends</span></h1>
            <div className="w-full gap-4 flex flex-col">
                {users.map((user, key) => (
                    <FriendCard key={key} name={user.name} />
                ))}
            </div>
        </div>
    )
}