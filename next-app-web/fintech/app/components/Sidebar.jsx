import Image from "next/image";
// import profile from "../../../public/sidebarprofile.svg";
import { Amaranth } from "next/font/google";

const amaranth = Amaranth({ subsets: ["latin"], weight: '400' });

export default function Sidebar() {
    return (
        <aside className={"left-0 bg-[#0F3941] min-w-50px w-[18vw] p-4 text-white rounded-xl " + amaranth.className}>
            <div className="flex gap-4 items-center border-b-1 border-b-white py-4">
                <Image src={"/images/hero/heroSection.svg"} alt={"profile"} width={40} height={40} />
                <p className="text-xl">Guest</p>
            </div>
            <div className="flex gap-4 items-center py-4">
                {/* <Image src={profile} alt={"profile"} width={40} height={40} /> */}
                <p className="text-lg">Home</p>
            </div>
            <div className="flex gap-4 items-center py-4">
                {/* <Image src={profile} alt={"profile"} width={40} height={40} /> */}
                <p className="text-lg">Discussion</p>
            </div>
            <div className="flex gap-4 items-center py-4">
                {/* <Image src={profile} alt={"profile"} width={40} height={40} /> */}
                <p className="text-lg">Community</p>
            </div>
            <div className="flex gap-4 items-center py-4">
                {/* <Image src={profile} alt={"profile"} width={40} height={40} /> */}
                <p className="text-lg">Courses</p>
            </div>
        </aside>
    )
}