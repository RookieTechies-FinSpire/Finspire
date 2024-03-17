import styles from "../../../public/styles/feed.module.css";

export default function MemeCard() {
    return (
        <div className={styles.memecard}>
            <div><Image /></div>
            <Image />
            <div></div>
            <div></div>
        </div>
    )
}