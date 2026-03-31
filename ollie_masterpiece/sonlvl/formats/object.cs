using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace SonicRetro.SonLVL.API.Rpg
{
	public class Object : ObjectLayoutFormat
	{
		public override Type ObjectType { get { return typeof(RpgObjectEntry); } }
		
		public override List<ObjectEntry> ReadLayout(byte[] rawdata, out bool terminator)
		{
			terminator = false;

			List<ObjectEntry> object_list = new List<ObjectEntry>();
			int object_count = ByteConverter.ToUInt16(rawdata, 0);

			int object_offset = 2;
			for (int i = 0; i < object_count; i++)
			{
				object_list.Add(new RpgObjectEntry(rawdata, object_offset));
				object_offset += RpgObjectEntry.Size;
			}
			return object_list;
		}
		
		public override byte[] WriteLayout(List<ObjectEntry> objects, bool terminator)
		{
			if (objects.Count == 0) return new byte[2];
			
			List<byte> tmp = new List<byte>();
			tmp.AddRange(ByteConverter.GetBytes((ushort)(objects.Count)));

			foreach (ObjectEntry object_entry in objects)
			{
				tmp.AddRange(object_entry.GetBytes());
			}
			return tmp.ToArray();
		}
	}
	
	[DefaultProperty("ID")]
	[Serializable]
	public class RpgObjectEntry : RememberStateObjectEntry
	{
		[Browsable(false)]
		public byte SubType2 { get; set; }

		[DisplayName("SubType2")]
		public string _SubType2
		{
			get { return SubType2.ToString("X2"); }
			set { SubType2 = byte.Parse(value, System.Globalization.NumberStyles.HexNumber); }
		}

		public static int Size { get { return 8; } }

		public RpgObjectEntry() { pos = new Position(this); isLoaded = true; }

		public RpgObjectEntry(byte[] file, int address)
		{
			byte[] bytes = new byte[Size];
			Array.Copy(file, address, bytes, 0, Size);
			FromBytes(bytes);
			pos = new Position(this);
			isLoaded = true;
		}

		public override byte[] GetBytes()
		{
			List<byte> ret = new List<byte>();
			ret.Add(0);
			ret.Add(ID);
			ret.Add(SubType);
			ret.Add(SubType2);
			ret.AddRange(ByteConverter.GetBytes(X));
			ret.AddRange(ByteConverter.GetBytes(Y));
			return ret.ToArray();
		}
		
		public override void FromBytes(byte[] bytes)
		{
			ID = bytes[1];
			SubType = bytes[2];
			SubType2 = bytes[3];
			X = ByteConverter.ToUInt16(bytes, 4);
			Y = ByteConverter.ToUInt16(bytes, 6);
			XFlip = false;
			YFlip = false;
			RememberState = false;
		}
	}
}