'use client'

import Image from "next/image";
import styles from "../../../public/styles/home.module.css";
import { useState } from "react";
export default function Navbar() {
    const [burgeropen, setBurgerOpen] = useState(false);

    const handleClick = () => {
        setBurgerOpen(!burgeropen);
    }
    return (
        <header className={styles.navbar}>
            <div className={styles.navbar_content}>
                <p>RookieTechies</p>
                <button onClick={() => { handleClick() }} className={(!burgeropen) ? styles.burger : styles.burger + " " + styles.burgeractive}><span></span><span></span><span></span></button>
                {/* <nav>
                    <ul>
                        <li>Home</li>
                        <li>About</li>
                        <li>Services</li>
                        <li>Contact</li>
                    </ul>
                </nav> */}
            </div>
        </header >
    )
}